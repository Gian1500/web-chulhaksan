import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateTeacherDto } from './dto/update-teacher.dto';

@Injectable()
export class TeachersService {
  constructor(private readonly prisma: PrismaService) {}

  async getById(id: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { id },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    return teacher;
  }

  async getByUserId(userId: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    return teacher;
  }

  async updateByUserId(userId: string, dto: UpdateTeacherDto) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    return this.prisma.teacher.update({
      where: { userId },
      data: dto,
    });
  }

  async getMyStudents(userId: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const assignments = await this.prisma.studentTeacherAssignment.findMany({
      where: {
        teacherId: teacher.id,
        active: true,
      },
      include: {
        student: true,
      },
      orderBy: {
        startAt: 'desc',
      },
    });

    return assignments.map((assignment) => assignment.student);
  }
}
