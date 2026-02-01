import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';
import { UserRole, UserStatus } from '@prisma/client';
import { compare, hash } from 'bcryptjs';
import { JwtService } from '@nestjs/jwt';
import { normalizeDni } from '../normalize';

@Injectable()
export class AuthService {
  constructor(
    private readonly prisma: PrismaService,
    private readonly jwtService: JwtService,
  ) {}

  async register(dto: RegisterDto) {
    if (dto.role === UserRole.ADMIN) {
      throw new BadRequestException('No puedes registrarte como admin.');
    }
    const normalizedDni = normalizeDni(dto.dni);
    if (
      dto.role === UserRole.STUDENT &&
      (!dto.birthDate || !dto.phone || !dto.guardianPhone || !dto.gym)
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
      throw new BadRequestException('El DNI ya esta registrado.');
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
        await tx.student.create({
          data: {
            dni: normalizedDni,
            userId: createdUser.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
            guardianPhone: dto.guardianPhone,
            gym: dto.gym,
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
      throw new BadRequestException('Credenciales invalidas.');
    }

    if (user.status !== UserStatus.ACTIVE) {
      throw new BadRequestException('Usuario bloqueado o pendiente.');
    }

    const isValid = await compare(dto.password, user.passwordHash);
    if (!isValid) {
      throw new BadRequestException('Credenciales invalidas.');
    }

    const payload = { sub: user.id, dni: user.dni, role: user.role };
    const accessToken = await this.jwtService.signAsync(payload);

    return { accessToken, mustChangePassword: user.mustChangePassword };
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
