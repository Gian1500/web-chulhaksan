import {
  BadRequestException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { UserRole, UserStatus } from '@prisma/client';
import { compare, hash } from 'bcryptjs';
import { JwtService } from '@nestjs/jwt';
import { PrismaService } from '../prisma/prisma.service';
import { normalizeDni } from '../normalize';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  private getAccessExpiresIn(): string | number {
    return this.asJwtExpires(process.env.JWT_ACCESS_EXPIRES_IN ?? '15m');
  }

  private getRefreshSecret() {
    return process.env.JWT_REFRESH_SECRET ?? process.env.JWT_SECRET ?? '';
  }

  private getRefreshExpiresIn(): string | number {
    return this.asJwtExpires(process.env.JWT_REFRESH_EXPIRES_IN ?? '7d');
  }

  private asJwtExpires(value: string): string | number {
    const raw = value.trim();
    if (!raw) return '15m';
    if (/^\d+$/.test(raw)) return Number(raw);
    return raw;
  }

  private isTestingModeEnabled() {
    return (process.env.TESTING_MODE ?? '').toLowerCase() === 'true';
  }

  private getTestingAllowedRoles() {
    const allowedRolesRaw = process.env.TESTING_ALLOWED_ROLES ?? 'TEACHER,ADMIN';
    return new Set(
      allowedRolesRaw
        .split(',')
        .map((item) => item.trim().toUpperCase())
        .filter(Boolean),
    );
  }

  private allowTeacherMirrorStudentsInTestingMode() {
    return (
      (process.env.TESTING_ALLOW_TEACHER_MIRROR_STUDENTS ?? '').toLowerCase() ===
      'true'
    );
  }

  private getTeacherMirrorStudentSuffix() {
    const suffix = (process.env.TESTING_TEACHER_MIRROR_STUDENT_SUFFIX ?? '9')
      .trim()
      .replace(/\s+/g, '');
    return suffix || '9';
  }

  private getTeacherMirrorBaseDni(studentDni: string) {
    const dni = normalizeDni(studentDni);
    const suffix = this.getTeacherMirrorStudentSuffix();
    if (!dni || !suffix) return null;
    if (!dni.endsWith(suffix)) return null;
    const base = dni.slice(0, -suffix.length);
    if (!base) return null;
    return base;
  }

  /**
   * Testing mode access rule:
   * - Allow the configured roles (default TEACHER,ADMIN).
   * - Optionally allow STUDENT accounts that mirror a TEACHER DNI by suffix (e.g. teacher 250... -> student 250...9).
   */
  private async ensureTestingModeAccessOrThrow(user: {
    role: UserRole;
    dni: string;
  }) {
    if (!this.isTestingModeEnabled()) {
      return { testingAllowMirrorStudent: false };
    }

    const allowedRoles = this.getTestingAllowedRoles();
    const role = String(user.role ?? '').toUpperCase();
    if (allowedRoles.has(role)) {
      return { testingAllowMirrorStudent: false };
    }

    if (
      this.allowTeacherMirrorStudentsInTestingMode() &&
      user.role === UserRole.STUDENT
    ) {
      const baseDni = this.getTeacherMirrorBaseDni(user.dni);
      if (baseDni) {
        const teacherUser = await this.prisma.user.findUnique({
          where: { dni: baseDni },
          select: { id: true, role: true, status: true },
        });
        if (
          teacherUser &&
          teacherUser.role === UserRole.TEACHER &&
          teacherUser.status === UserStatus.ACTIVE
        ) {
          return { testingAllowMirrorStudent: true };
        }
      }
    }

    throw new ForbiddenException('Sistema en modo prueba. Acceso restringido.');
  }

  private parseDurationToSeconds(
    value: string | number,
    fallbackSeconds: number,
  ) {
    if (typeof value === 'number' && Number.isFinite(value)) {
      return value;
    }
    const raw = String(value ?? '').trim();
    if (!raw) return fallbackSeconds;
    if (/^\d+$/.test(raw)) return Number(raw);
    const match = raw.match(/^(\d+)([smhd])$/i);
    if (!match) return fallbackSeconds;
    const amount = Number(match[1]);
    const unit = match[2].toLowerCase();
    const multipliers: Record<string, number> = {
      s: 1,
      m: 60,
      h: 3600,
      d: 86400,
    };
    return amount * (multipliers[unit] ?? fallbackSeconds);
  }

  private async issueTokens(payload: {
    sub: string;
    dni: string;
    role: UserRole;
    testingAllowMirrorStudent?: boolean;
  }) {
    const accessToken = await this.jwtService.signAsync(payload, {
      expiresIn: this.getAccessExpiresIn() as any,
    });
    const refreshExpiresIn = this.getRefreshExpiresIn();
    const refreshToken = await this.jwtService.signAsync(payload, {
      secret: this.getRefreshSecret(),
      expiresIn: refreshExpiresIn as any,
    });
    const refreshExpiresAt = new Date(
      Date.now() +
        this.parseDurationToSeconds(refreshExpiresIn, 7 * 86400) * 1000,
    );
    return { accessToken, refreshToken, refreshExpiresAt };
  }

  async register(dto: RegisterDto) {
    const allowPublicRegister =
      (process.env.ALLOW_PUBLIC_REGISTER ?? '').toLowerCase() === 'true';
    if (process.env.NODE_ENV === 'production' && !allowPublicRegister) {
      throw new BadRequestException('Registro público deshabilitado.');
    }
    if (dto.role === UserRole.ADMIN) {
      throw new BadRequestException('No puedes registrarte como admin.');
    }
    const normalizedDni = normalizeDni(dto.dni);
    if (
      dto.role === UserRole.STUDENT &&
      (!dto.birthDate || !dto.phone || !dto.guardianPhone || !dto.gymId)
    ) {
      throw new BadRequestException(
        'Faltan datos obligatorios del alumno.',
      );
    }
    if (dto.role === UserRole.TEACHER && !dto.phone) {
      throw new BadRequestException(
        'Faltan datos obligatorios del profesor.',
      );
    }

    const existing = await this.prisma.user.findUnique({
      where: { dni: normalizedDni },
      select: { id: true },
    });
    if (existing) {
      throw new BadRequestException('El DNI ya está registrado.');
    }

    const passwordHash = await hash(dto.password, 10);

    const user = await this.prisma.$transaction(async (tx) => {
      const createdUser = await tx.user.create({
        data: {
          dni: normalizedDni,
          passwordHash,
          role: dto.role,
          status: UserStatus.ACTIVE,
        },
      });

      if (dto.role === UserRole.STUDENT) {
        const resolvedGym = dto.gymId
          ? await tx.gym.findUnique({
              where: { id: dto.gymId },
              select: { id: true },
            })
          : await tx.gym.findUnique({
              // Fallback for old register flows / missing data.
              where: { name: 'Sin gimnasio' },
              select: { id: true },
            });

        if (!resolvedGym) {
          throw new BadRequestException('El gimnasio es inválido.');
        }

        await tx.student.create({
          data: {
            dni: normalizedDni,
            userId: createdUser.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
            guardianPhone: dto.guardianPhone,
            gymId: resolvedGym.id,
            birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
            address: dto.address,
          },
        });
      }

      if (dto.role === UserRole.TEACHER) {
        await tx.teacher.create({
          data: {
            userId: createdUser.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
          },
        });
      }

      return createdUser;
    });

    return {
      id: user.id,
      dni: user.dni,
      role: user.role,
      status: user.status,
    };
  }

  async login(dto: LoginDto) {
    const normalizedDni = normalizeDni(dto.dni);
    const user = await this.prisma.user.findUnique({
      where: { dni: normalizedDni },
    });

    if (!user) {
      throw new BadRequestException('Credenciales inválidas.');
    }

    if (user.status !== UserStatus.ACTIVE) {
      throw new BadRequestException('Usuario bloqueado o pendiente.');
    }

    const isValid = await compare(dto.password, user.passwordHash);
    if (!isValid) {
      throw new BadRequestException('Credenciales inválidas.');
    }

    const { testingAllowMirrorStudent } = await this.ensureTestingModeAccessOrThrow(
      { role: user.role, dni: user.dni },
    );

    const payload = {
      sub: user.id,
      dni: user.dni,
      role: user.role,
      testingAllowMirrorStudent,
    };
    const { accessToken, refreshToken, refreshExpiresAt } =
      await this.issueTokens(payload);
    const refreshTokenHash = await hash(refreshToken, 10);

    await this.prisma.user.update({
      where: { id: user.id },
      data: {
        refreshTokenHash,
        refreshTokenExpiresAt: refreshExpiresAt,
      },
    });

    return {
      accessToken,
      refreshToken,
      mustChangePassword: user.mustChangePassword,
    };
  }

  async refreshSession(refreshToken: string) {
    if (!refreshToken) {
      throw new BadRequestException('Sesión expirada.');
    }

    let payload: {
      sub: string;
      dni: string;
      role: UserRole;
      testingAllowMirrorStudent?: boolean;
    };
    try {
      payload = await this.jwtService.verifyAsync(refreshToken, {
        secret: this.getRefreshSecret(),
      });
    } catch {
      throw new BadRequestException('Sesión inválida.');
    }

    const user = await this.prisma.user.findUnique({
      where: { id: payload.sub },
      select: {
        id: true,
        dni: true,
        role: true,
        status: true,
        mustChangePassword: true,
        refreshTokenHash: true,
        refreshTokenExpiresAt: true,
      },
    });
    if (!user || !user.refreshTokenHash) {
      throw new BadRequestException('Sesión inválida.');
    }
    if (user.status !== UserStatus.ACTIVE) {
      throw new BadRequestException('Usuario bloqueado o pendiente.');
    }

    const { testingAllowMirrorStudent } = await this.ensureTestingModeAccessOrThrow(
      { role: user.role, dni: user.dni },
    );

    if (
      user.refreshTokenExpiresAt &&
      user.refreshTokenExpiresAt.getTime() < Date.now()
    ) {
      throw new BadRequestException('Sesión expirada.');
    }
    const isValid = await compare(refreshToken, user.refreshTokenHash);
    if (!isValid) {
      throw new BadRequestException('Sesión inválida.');
    }

    const { accessToken, refreshToken: nextRefreshToken, refreshExpiresAt } =
      await this.issueTokens({
        sub: user.id,
        dni: user.dni,
        role: user.role,
        testingAllowMirrorStudent,
      });
    const refreshTokenHash = await hash(nextRefreshToken, 10);

    await this.prisma.user.update({
      where: { id: user.id },
      data: {
        refreshTokenHash,
        refreshTokenExpiresAt: refreshExpiresAt,
      },
    });

    return {
      accessToken,
      refreshToken: nextRefreshToken,
      mustChangePassword: user.mustChangePassword,
    };
  }

  async logout(userId?: string) {
    if (!userId) return;
    await this.prisma.user.update({
      where: { id: userId },
      data: { refreshTokenHash: null, refreshTokenExpiresAt: null },
    });
  }

  async logoutByRefreshToken(refreshToken: string) {
    if (!refreshToken) return;
    try {
      const payload = await this.jwtService.verifyAsync(refreshToken, {
        secret: this.getRefreshSecret(),
      });
      await this.logout(payload.sub);
    } catch {
      return;
    }
  }

  async getMe(userId: string) {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, dni: true, role: true, mustChangePassword: true },
    });

    if (!user) {
      throw new NotFoundException('Usuario no encontrado.');
    }

    return {
      sub: user.id,
      dni: user.dni,
      role: user.role,
      mustChangePassword: user.mustChangePassword,
    };
  }

  async changePassword(
    userId: string,
    data: { currentPassword?: string; newPassword: string },
  ) {
    if (!data.newPassword?.trim()) {
      throw new BadRequestException('La nueva contraseña es obligatoria.');
    }

    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true, passwordHash: true, mustChangePassword: true },
    });

    if (!user) {
      throw new NotFoundException('Usuario no encontrado.');
    }

    if (data.currentPassword?.trim()) {
      const isValid = await compare(data.currentPassword, user.passwordHash);
      if (!isValid) {
        throw new BadRequestException('La contraseña actual no es válida.');
      }
    } else if (!user.mustChangePassword) {
      throw new BadRequestException('Debes ingresar la contraseña actual.');
    }

    const passwordHash = await hash(data.newPassword.trim(), 10);
    await this.prisma.user.update({
      where: { id: userId },
      data: { passwordHash, mustChangePassword: false },
    });

    return { changed: true };
  }
}
