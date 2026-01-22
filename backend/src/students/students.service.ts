import { Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UpdateStudentDto } from './dto/update-student.dto';

@Injectable()
export class StudentsService {
  constructor(private readonly prisma: PrismaService) {}

  async getByDni(dni: string) {
    const student = await this.prisma.student.findUnique({
      where: { dni },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    return student;
  }

  async updateByDni(dni: string, dto: UpdateStudentDto) {
    const student = await this.prisma.student.findUnique({
      where: { dni },
      select: { dni: true },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    return this.prisma.student.update({
      where: { dni },
      data: {
        ...dto,
        birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
      },
    });
  }
}
