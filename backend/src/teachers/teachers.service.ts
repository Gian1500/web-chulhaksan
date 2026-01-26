import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { UserRole, UserStatus } from '@prisma/client';
import { hash } from 'bcryptjs';
import { createHmac, timingSafeEqual } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { normalizeDni } from '../normalize';
import { CreateStudentDto } from './dto/create-student.dto';
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

  async listAvailableStudents() {
    return this.prisma.student.findMany({
      where: {
        assignments: {
          none: { active: true },
        },
      },
      select: {
        dni: true,
        firstName: true,
        lastName: true,
        gym: true,
      },
      orderBy: { lastName: 'asc' },
    });
  }

  async assignStudent(userId: string, studentDni: string) {
    const normalizedDni = normalizeDni(studentDni);
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const activeAssignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni: normalizedDni,
        active: true,
      },
    });

    if (activeAssignment) {
      if (activeAssignment.teacherId === teacher.id) {
        return activeAssignment;
      }
      throw new BadRequestException('El alumno ya tiene profesor asignado.');
    }

    return this.prisma.studentTeacherAssignment.create({
      data: {
        studentDni: normalizedDni,
        teacherId: teacher.id,
        startAt: new Date(),
        active: true,
      },
    });
  }

  async unassignStudent(userId: string, studentDni: string) {
    const normalizedDni = normalizeDni(studentDni);
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
      throw new NotFoundException('El alumno no esta asignado a este profesor.');
    }

    return this.prisma.studentTeacherAssignment.update({
      where: { id: assignment.id },
      data: { active: false, endAt: new Date() },
    });
  }

  async createStudent(userId: string, dto: CreateStudentDto) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const normalizedDni = normalizeDni(dto.dni);
    const existing = await this.prisma.user.findUnique({
      where: { dni: normalizedDni },
      select: { id: true },
    });

    if (existing) {
      throw new BadRequestException('El DNI ya esta registrado.');
    }

    const passwordValue = dto.password?.trim() || normalizedDni;
    const passwordHash = await hash(passwordValue, 10);

    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
        data: {
          dni: normalizedDni,
          passwordHash,
          role: UserRole.STUDENT,
          status: UserStatus.ACTIVE,
        },
      });

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
          birthDate: dto.birthDate ? new Date(dto.birthDate) : undefined,
          address: dto.address,
        },
      });

      return tx.studentTeacherAssignment.create({
        data: {
          studentDni: normalizedDni,
          teacherId: teacher.id,
          startAt: new Date(),
          active: true,
        },
      });
    });
  }

  getMpConnectUrl(userId: string) {
    const clientId = process.env.MP_CLIENT_ID;
    const redirectUri = process.env.MP_OAUTH_REDIRECT_URI;
    if (!clientId || !redirectUri) {
      throw new BadRequestException('Mercado Pago OAuth no configurado.');
    }

    if (!userId) {
      throw new BadRequestException('Usuario invalido.');
    }

    const state = this.createMpState(userId);
    const url = new URL('https://auth.mercadopago.com/authorization');
    url.searchParams.set('client_id', clientId);
    url.searchParams.set('response_type', 'code');
    url.searchParams.set('platform_id', 'mp');
    url.searchParams.set('redirect_uri', redirectUri);
    url.searchParams.set('state', state);

    return { url: url.toString() };
  }

  async handleMpCallback(code: string, state: string) {
    if (!code || !state) {
      throw new BadRequestException('Codigo o estado invalido.');
    }

    const userId = this.verifyMpState(state);
    const clientId = process.env.MP_CLIENT_ID;
    const clientSecret = process.env.MP_CLIENT_SECRET;
    const redirectUri = process.env.MP_OAUTH_REDIRECT_URI;

    if (!clientId || !clientSecret || !redirectUri) {
      throw new BadRequestException('Mercado Pago OAuth no configurado.');
    }

    const body = new URLSearchParams({
      grant_type: 'authorization_code',
      client_id: clientId,
      client_secret: clientSecret,
      code,
      redirect_uri: redirectUri,
    });

    const response = await fetch('https://api.mercadopago.com/oauth/token', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body,
    });

    if (!response.ok) {
      const errorBody = await response.json().catch(() => ({}));
      throw new BadRequestException(
        errorBody.message ?? 'No se pudo conectar Mercado Pago.',
      );
    }

    const data = (await response.json()) as {
      access_token: string;
      refresh_token: string;
      expires_in: number;
      user_id: number;
    };

    const expiresAt = new Date(Date.now() + data.expires_in * 1000);

    await this.prisma.teacher.update({
      where: { userId },
      data: {
        mpAccessToken: data.access_token,
        mpRefreshToken: data.refresh_token,
        mpTokenExpiresAt: expiresAt,
        mpUserId: String(data.user_id),
        mpConnectedAt: new Date(),
      },
    });

    return { connected: true };
  }

  private createMpState(userId: string) {
    const secret = process.env.MP_OAUTH_STATE_SECRET;
    if (!secret) {
      throw new BadRequestException('MP_OAUTH_STATE_SECRET no configurado.');
    }
    const payload = Buffer.from(
      JSON.stringify({ userId, ts: Date.now() }),
    ).toString('base64url');
    const signature = createHmac('sha256', secret).update(payload).digest('hex');
    return `${payload}.${signature}`;
  }

  private verifyMpState(state: string) {
    const secret = process.env.MP_OAUTH_STATE_SECRET;
    if (!secret) {
      throw new BadRequestException('MP_OAUTH_STATE_SECRET no configurado.');
    }
    const [payload, signature] = state.split('.');
    if (!payload || !signature) {
      throw new BadRequestException('Estado invalido.');
    }
    const expected = createHmac('sha256', secret).update(payload).digest('hex');
    if (signature.length !== expected.length) {
      throw new BadRequestException('Estado invalido.');
    }
    const isValid = timingSafeEqual(
      Buffer.from(signature),
      Buffer.from(expected),
    );
    if (!isValid) {
      throw new BadRequestException('Estado invalido.');
    }
    const parsed = JSON.parse(Buffer.from(payload, 'base64url').toString());
    if (!parsed?.userId) {
      throw new BadRequestException('Estado invalido.');
    }
    return parsed.userId as string;
  }
}
