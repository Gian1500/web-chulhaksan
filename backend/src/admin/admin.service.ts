import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAdminUserDto } from './dto/create-admin-user.dto';
import { ListUsersDto } from './dto/list-users.dto';
import { UpdateUserStatusDto } from './dto/update-user-status.dto';
import { UserRole, UserStatus } from '@prisma/client';
import { hash } from 'bcryptjs';
import { normalizeDni } from '../normalize';
import { UpdateStudentDto } from '../students/dto/update-student.dto';
import { UpdateTeacherDto } from '../teachers/dto/update-teacher.dto';

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

    const normalizedDni = normalizeDni(dto.dni);
    const existing = await this.prisma.user.findUnique({
      where: { dni: normalizedDni },
      select: { id: true },
    });
    if (existing) {
      throw new BadRequestException('El DNI ya esta registrado.');
    }

    const passwordHash = await hash(dto.password, 10);

    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
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
            userId: user.id,
            firstName: dto.firstName,
            lastName: dto.lastName,
            email: dto.email,
            phone: dto.phone,
            guardianPhone: dto.guardianPhone,
            gym: dto.gym,
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

  async updateStudent(dni: string, dto: UpdateStudentDto) {
    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    return this.prisma.student.update({
      where: { dni: normalizedDni },
      data: {
        ...dto,
        birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
      },
    });
  }

  async updateTeacher(id: string, dto: UpdateTeacherDto) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { id },
      select: { id: true },
    });
    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    return this.prisma.teacher.update({
      where: { id },
      data: {
        ...dto,
        birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
        gyms: dto.gyms ?? undefined,
      },
    });
  }
}
