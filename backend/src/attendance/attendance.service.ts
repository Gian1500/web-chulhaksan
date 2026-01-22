import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { MarkAttendanceDto } from './dto/mark-attendance.dto';

@Injectable()
export class AttendanceService {
  constructor(private readonly prisma: PrismaService) {}

  async markAttendance(dto: MarkAttendanceDto) {
    const student = await this.prisma.student.findUnique({
      where: { dni: dto.studentDni },
      select: { dni: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const date = new Date(dto.date);
    if (Number.isNaN(date.getTime())) {
      throw new BadRequestException('Fecha invalida.');
    }

    return this.prisma.attendance.upsert({
      where: {
        studentDni_date: {
          studentDni: dto.studentDni,
          date,
        },
      },
      update: {
        present: dto.present,
        notes: dto.notes ?? undefined,
      },
      create: {
        studentDni: dto.studentDni,
        date,
        present: dto.present,
        notes: dto.notes ?? undefined,
      },
    });
  }

  async listByStudent(dni: string) {
    return this.prisma.attendance.findMany({
      where: { studentDni: dni },
      orderBy: { date: 'desc' },
    });
  }
}
