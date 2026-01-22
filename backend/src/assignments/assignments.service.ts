import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { RequestCreatedBy, RequestStatus, UserRole } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { CreateRequestDto } from './dto/create-request.dto';

@Injectable()
export class AssignmentsService {
  constructor(private readonly prisma: PrismaService) {}

  async createRequest(user: any, dto: CreateRequestDto) {
    if (user.role === UserRole.STUDENT && user.dni !== dto.studentDni) {
      throw new BadRequestException('No puedes solicitar por otro alumno.');
    }

    if (user.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: user.sub },
        select: { id: true },
      });
      if (!teacher || teacher.id !== dto.teacherId) {
        throw new BadRequestException('Profesor invalido.');
      }
    }

    const student = await this.prisma.student.findUnique({
      where: { dni: dto.studentDni },
      select: { dni: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const teacher = await this.prisma.teacher.findUnique({
      where: { id: dto.teacherId },
      select: { id: true },
    });
    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const createdByRole =
      user.role === UserRole.STUDENT
        ? RequestCreatedBy.STUDENT
        : RequestCreatedBy.TEACHER;

    const status =
      createdByRole === RequestCreatedBy.STUDENT
        ? RequestStatus.PENDING_TEACHER
        : RequestStatus.PENDING_STUDENT;

    return this.prisma.studentTeacherRequest.create({
      data: {
        studentDni: dto.studentDni,
        teacherId: dto.teacherId,
        status,
        createdByRole,
        createdByUserId: user.sub,
      },
    });
  }

  async listMyPendingRequests(user: any) {
    if (user.role === UserRole.STUDENT) {
      return this.prisma.studentTeacherRequest.findMany({
        where: {
          studentDni: user.dni,
          status: RequestStatus.PENDING_STUDENT,
        },
        include: { teacher: true },
        orderBy: { createdAt: 'desc' },
      });
    }

    if (user.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: user.sub },
        select: { id: true },
      });
      if (!teacher) {
        throw new NotFoundException('Profesor no encontrado.');
      }
      return this.prisma.studentTeacherRequest.findMany({
        where: {
          teacherId: teacher.id,
          status: RequestStatus.PENDING_TEACHER,
        },
        include: { student: true },
        orderBy: { createdAt: 'desc' },
      });
    }

    throw new BadRequestException('Rol invalido.');
  }

  async approveRequest(user: any, id: string) {
    const request = await this.prisma.studentTeacherRequest.findUnique({
      where: { id },
    });
    if (!request) {
      throw new NotFoundException('Solicitud no encontrada.');
    }
    if (request.status === RequestStatus.ACCEPTED) {
      return request;
    }
    if (request.status === RequestStatus.REJECTED) {
      throw new BadRequestException('Solicitud rechazada.');
    }

    await this.ensureCanAct(user, request);

    return this.prisma.$transaction(async (tx) => {
      await tx.studentTeacherRequest.update({
        where: { id },
        data: { status: RequestStatus.ACCEPTED },
      });

      await tx.studentTeacherAssignment.updateMany({
        where: { studentDni: request.studentDni, active: true },
        data: { active: false, endAt: new Date() },
      });

      return tx.studentTeacherAssignment.create({
        data: {
          studentDni: request.studentDni,
          teacherId: request.teacherId,
          startAt: new Date(),
          active: true,
        },
      });
    });
  }

  async rejectRequest(user: any, id: string) {
    const request = await this.prisma.studentTeacherRequest.findUnique({
      where: { id },
    });
    if (!request) {
      throw new NotFoundException('Solicitud no encontrada.');
    }
    if (request.status === RequestStatus.ACCEPTED) {
      throw new BadRequestException('Solicitud ya aceptada.');
    }
    if (request.status === RequestStatus.REJECTED) {
      return request;
    }

    await this.ensureCanAct(user, request);

    return this.prisma.studentTeacherRequest.update({
      where: { id },
      data: { status: RequestStatus.REJECTED },
    });
  }

  private async ensureCanAct(user: any, request: any) {
    if (request.status === RequestStatus.PENDING_TEACHER) {
      if (user.role !== UserRole.TEACHER) {
        throw new BadRequestException('Accion no permitida.');
      }
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: user.sub },
        select: { id: true },
      });
      if (!teacher || teacher.id !== request.teacherId) {
        throw new BadRequestException('Accion no permitida.');
      }
    }

    if (request.status === RequestStatus.PENDING_STUDENT) {
      if (user.role !== UserRole.STUDENT) {
        throw new BadRequestException('Accion no permitida.');
      }
      if (user.dni !== request.studentDni) {
        throw new BadRequestException('Accion no permitida.');
      }
    }
  }
}
