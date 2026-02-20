import { ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { normalizeDni } from '../normalize';
import { UpdateStudentDto } from './dto/update-student.dto';

@Injectable()
export class StudentsService {
  constructor(private readonly prisma: PrismaService) {}

  async getByDni(dni: string) {
    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      include: {
        gym: { select: { name: true } },
      },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    // Normalize gym shape for the frontend (string name instead of nested relation object).
    const { gym, ...rest } = student;
    return { ...rest, gym: gym?.name ?? null };
  }

  async getByDniForTeacher(userId: string, dni: string) {
    const normalizedDni = normalizeDni(dni);
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni: normalizedDni,
        teacherId: teacher.id,
        active: true,
      },
    });

    if (!assignment) {
      throw new ForbiddenException('No tienes permisos para este alumno.');
    }

    return this.getByDni(normalizedDni);
  }

  async getTeacherSummary(dni: string) {
    const normalizedDni = normalizeDni(dni);
    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni: normalizedDni,
        active: true,
      },
      include: {
        teacher: true,
      },
      orderBy: { startAt: 'desc' },
    });

    if (!assignment?.teacher) {
      return null;
    }

    return {
      firstName: assignment.teacher.firstName,
      lastName: assignment.teacher.lastName,
      assignedAt: assignment.startAt,
    };
  }

  async updateByDni(dni: string, dto: UpdateStudentDto) {
    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const hasGymField = Object.prototype.hasOwnProperty.call(dto, 'gymId');
    const nextGymId = hasGymField ? (dto.gymId ?? null) : undefined;
    const nextGym = dto.gymId
      ? await this.prisma.gym.findFirst({
          where: { id: dto.gymId, isArchived: false },
          select: { id: true },
        })
      : null;
    if (dto.gymId && !nextGym) {
      throw new ForbiddenException('El gimnasio es inválido.');
    }

    return this.prisma.student.update({
      where: { dni: normalizedDni },
      data: {
        firstName: dto.firstName ?? undefined,
        lastName: dto.lastName ?? undefined,
        email: dto.email ?? undefined,
        phone: dto.phone ?? undefined,
        guardianPhone: dto.guardianPhone ?? undefined,
        gymId:
          nextGymId === undefined
            ? undefined
            : nextGymId === null
              ? null
              : nextGym?.id,
        address: dto.address ?? undefined,
        birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
      },
    });
  }
}
