import { BadRequestException, Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { LoginDto } from './dto/login.dto';
import { RegisterDto } from './dto/register.dto';
import { UserRole, UserStatus } from '@prisma/client';
import { compare, hash } from 'bcryptjs';
import { JwtService } from '@nestjs/jwt';

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
    if (dto.password === dto.dni) {
      throw new BadRequestException('La contrasena no puede ser el DNI.');
    }
    if (
      dto.role === UserRole.STUDENT &&
      (!dto.birthDate || !dto.address || !dto.email || !dto.phone)
    ) {
      throw new BadRequestException(
        'Faltan datos obligatorios del alumno.',
      );
    }
    if (dto.role === UserRole.TEACHER && (!dto.email || !dto.phone)) {
      throw new BadRequestException(
        'Faltan datos obligatorios del profesor.',
      );
    }

    const existing = await this.prisma.user.findUnique({
      where: { dni: dto.dni },
      select: { id: true },
    });
    if (existing) {
      throw new BadRequestException('El DNI ya esta registrado.');
    }

    const passwordHash = await hash(dto.password, 10);

    const user = await this.prisma.$transaction(async (tx) => {
      const createdUser = await tx.user.create({
        data: {
          dni: dto.dni,
          passwordHash,
          role: dto.role,
          status: UserStatus.ACTIVE,
        },
      });

      if (dto.role === UserRole.STUDENT) {
        await tx.student.create({
          data: {
            dni: dto.dni,
            userId: createdUser.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
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
    const user = await this.prisma.user.findUnique({
      where: { dni: dto.dni },
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

    return { accessToken };
  }
}
