import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAdminUserDto } from './dto/create-admin-user.dto';
import { ListUsersDto } from './dto/list-users.dto';
import { UpdateUserStatusDto } from './dto/update-user-status.dto';
import { UserRole, UserStatus } from '@prisma/client';
import { hash } from 'bcryptjs';

@Injectable()
export class AdminService {
  constructor(private readonly prisma: PrismaService) {}

  async listUsers(filters?: ListUsersDto) {
    const where: any = {};
    if (filters?.role) {
      where.role = filters.role;
    }
    if (filters?.status) {
      where.status = filters.status;
    }
    if (filters?.search) {
      where.OR = [
        { dni: { contains: filters.search } },
        { student: { firstName: { contains: filters.search, mode: 'insensitive' } } },
        { student: { lastName: { contains: filters.search, mode: 'insensitive' } } },
        { teacher: { firstName: { contains: filters.search, mode: 'insensitive' } } },
        { teacher: { lastName: { contains: filters.search, mode: 'insensitive' } } },
      ];
    }

    return this.prisma.user.findMany({
      where,
      select: {
        id: true,
        dni: true,
        role: true,
        status: true,
        createdAt: true,
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async createUser(dto: CreateAdminUserDto) {
    if (dto.role === UserRole.ADMIN) {
      throw new BadRequestException('No puedes crear admin desde aqui.');
    }

    const existing = await this.prisma.user.findUnique({
      where: { dni: dto.dni },
      select: { id: true },
    });
    if (existing) {
      throw new BadRequestException('El DNI ya esta registrado.');
    }

    const passwordHash = await hash(dto.password, 10);

    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
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
            userId: user.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
          },
        });
      }

      if (dto.role === UserRole.TEACHER) {
        await tx.teacher.create({
          data: {
            userId: user.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
          },
        });
      }

      return {
        id: user.id,
        dni: user.dni,
        role: user.role,
        status: user.status,
      };
    });
  }

  async updateUserStatus(userId: string, dto: UpdateUserStatusDto) {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true },
    });
    if (!user) {
      throw new NotFoundException('Usuario no encontrado.');
    }

    return this.prisma.user.update({
      where: { id: userId },
      data: { status: dto.status },
    });
  }

  async listStudents() {
    return this.prisma.student.findMany({
      include: {
        user: {
          select: { id: true, status: true, createdAt: true },
        },
      },
      orderBy: { createdAt: 'desc' },
    });
  }

  async listTeachers() {
    return this.prisma.teacher.findMany({
      include: {
        user: {
          select: { id: true, status: true, createdAt: true },
        },
      },
      orderBy: { createdAt: 'desc' },
    });
  }
}
