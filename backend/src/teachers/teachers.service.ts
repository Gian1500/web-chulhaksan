import { BadRequestException, Injectable, NotFoundException } from '@nestjs/common';
import { FeeStatus, Prisma, UserRole, UserStatus } from '@prisma/client';
import { hash } from 'bcryptjs';
import { createHash, createHmac, randomBytes, timingSafeEqual } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { normalizeDni } from '../normalize';
import { CreateStudentDto } from './dto/create-student.dto';

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

  async disconnectMp(userId: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    return this.prisma.teacher.update({
      where: { userId },
      data: {
        mpAccessToken: null,
        mpRefreshToken: null,
        mpTokenExpiresAt: null,
        mpUserId: null,
        mpConnectedAt: null,
      },
    });
  }

  async getMyStudents(
    userId: string,
    params?: { page?: number; limit?: number; search?: string },
  ) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });

    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const page = Math.max(1, params?.page ?? 1);
    const limit = Math.max(1, params?.limit ?? 10);
    const skip = (page - 1) * limit;
    const search = params?.search?.trim();

    const where: Prisma.StudentTeacherAssignmentWhereInput = {
      teacherId: teacher.id,
      active: true,
      student: search
        ? {
            OR: [
              { dni: { contains: search } },
              { firstName: { contains: search, mode: Prisma.QueryMode.insensitive } },
              { lastName: { contains: search, mode: Prisma.QueryMode.insensitive } },
            ],
          }
        : undefined,
    };

    const [total, assignments] = (await this.prisma.$transaction([
      this.prisma.studentTeacherAssignment.count({ where }),
      this.prisma.studentTeacherAssignment.findMany({
        where,
        include: { student: true },
        orderBy: { startAt: 'desc' },
        skip,
        take: limit,
      }),
    ])) as [
      number,
      Prisma.StudentTeacherAssignmentGetPayload<{ include: { student: true } }>[],
    ];

    const data = assignments.map((assignment) => assignment.student);
    return { data, total, page, limit };
  }

  async listAvailableStudents(params?: { page?: number; limit?: number; search?: string }) {
    const page = Math.max(1, params?.page ?? 1);
    const limit = Math.max(1, params?.limit ?? 10);
    const skip = (page - 1) * limit;
    const search = params?.search?.trim();

    const where: Prisma.StudentWhereInput = {
      assignments: {
        none: { active: true },
      },
      ...(search
        ? {
            OR: [
              { dni: { contains: search } },
              { firstName: { contains: search, mode: Prisma.QueryMode.insensitive } },
              { lastName: { contains: search, mode: Prisma.QueryMode.insensitive } },
            ],
          }
        : {}),
    };

    const [total, data] = await this.prisma.$transaction([
      this.prisma.student.count({ where }),
      this.prisma.student.findMany({
        where,
        select: {
          dni: true,
          firstName: true,
          lastName: true,
          gym: true,
        },
        orderBy: { lastName: 'asc' },
        skip,
        take: limit,
      }),
    ]);

    return { data, total, page, limit };
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

    const passwordValue = dto.password.trim();
    const passwordHash = await hash(passwordValue, 10);
    const firstName = dto.firstName?.trim() || 'Sin nombre';
    const lastName = dto.lastName?.trim() || 'Sin apellido';
    const email = dto.email?.trim() || null;
    const phone = dto.phone?.trim() || null;
    const guardianPhone = dto.guardianPhone?.trim() || null;
    const gym = dto.gym?.trim() || null;
    const address = dto.address?.trim() || null;
    const birthDateValue = dto.birthDate?.trim();

    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
        data: {
          dni: normalizedDni,
          passwordHash,
          role: UserRole.STUDENT,
          status: UserStatus.ACTIVE,
          mustChangePassword: true,
        },
      });

      await tx.student.create({
        data: {
          dni: normalizedDni,
          userId: user.id,
          firstName,
          lastName,
          email,
          phone,
          guardianPhone,
          gym,
          birthDate: birthDateValue ? new Date(birthDateValue) : undefined,
          address,
        },
      });

      const activeFee = await tx.globalFeeSetting.findFirst({
        where: { isActive: true },
        orderBy: { createdAt: 'desc' },
      });
      if (!activeFee) {
        throw new BadRequestException('No hay cuota global activa.');
      }
      const now = new Date();
      const month = now.getMonth() + 1;
      const year = now.getFullYear();
      const dueDate = new Date(year, month - 1, 10);
      await tx.monthlyFee.createMany({
        data: [
          {
            studentDni: normalizedDni,
            month,
            year,
            amount: activeFee.monthlyAmount,
            status: FeeStatus.PENDING,
            dueDate,
          },
        ],
        skipDuplicates: true,
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

  async deleteStudent(userId: string, studentDni: string) {
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
      select: { dni: true, userId: true },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni: normalizedDni,
        teacherId: teacher.id,
        active: true,
      },
      select: { id: true },
    });

    if (!assignment) {
      throw new BadRequestException('El alumno no está asignado a este profesor.');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.payment.deleteMany({
        where: { fee: { studentDni: normalizedDni } },
      });
      await tx.monthlyFee.deleteMany({ where: { studentDni: normalizedDni } });
      await tx.attendance.deleteMany({ where: { studentDni: normalizedDni } });
      await tx.studentTeacherAssignment.deleteMany({
        where: { studentDni: normalizedDni },
      });
      await tx.studentTeacherRequest.deleteMany({
        where: { studentDni: normalizedDni },
      });
      await tx.student.delete({ where: { dni: normalizedDni } });
      await tx.user.delete({ where: { id: student.userId } });
    });

    return { deleted: true };
  }

  async resetStudentPassword(userId: string, studentDni: string) {
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
      select: { dni: true, userId: true },
    });

    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni: normalizedDni,
        teacherId: teacher.id,
        active: true,
      },
      select: { id: true },
    });

    if (!assignment) {
      throw new BadRequestException('El alumno no está asignado a este profesor.');
    }

    const temporaryPassword = `CHS-${randomBytes(4).toString('hex')}`;
    const passwordHash = await hash(temporaryPassword, 10);

    await this.prisma.user.update({
      where: { id: student.userId },
      data: { passwordHash, mustChangePassword: true },
    });

    return { temporaryPassword };
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

    const verifier = this.createPkceVerifier();
    const challenge = this.createPkceChallenge(verifier);
    const state = this.createMpState(userId, verifier);
    const url = new URL('https://auth.mercadopago.com/authorization');
    url.searchParams.set('client_id', clientId);
    url.searchParams.set('response_type', 'code');
    url.searchParams.set('platform_id', 'mp');
    url.searchParams.set('redirect_uri', redirectUri);
    url.searchParams.set('state', state);
    url.searchParams.set('code_challenge', challenge);
    url.searchParams.set('code_challenge_method', 'S256');

    return { url: url.toString() };
  }

  async handleMpCallback(code: string, state: string) {
    if (!code || !state) {
      throw new BadRequestException('Codigo o estado invalido.');
    }

    const { userId, verifier } = this.verifyMpState(state);
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
      code_verifier: verifier,
    });
    if ((process.env.MP_OAUTH_TEST_TOKEN ?? '').toLowerCase() === 'true') {
      body.set('test_token', 'true');
    }

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
      live_mode?: boolean;
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

  private createMpState(userId: string, verifier: string) {
    const secret = process.env.MP_OAUTH_STATE_SECRET;
    if (!secret) {
      throw new BadRequestException('MP_OAUTH_STATE_SECRET no configurado.');
    }
    const payload = Buffer.from(
      JSON.stringify({ userId, ts: Date.now(), verifier }),
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
    if (!parsed?.userId || !parsed?.verifier) {
      throw new BadRequestException('Estado invalido.');
    }
    return { userId: parsed.userId as string, verifier: parsed.verifier as string };
  }

  private createPkceVerifier() {
    return this.base64Url(randomBytes(64));
  }

  private createPkceChallenge(verifier: string) {
    const hash = createHash('sha256').update(verifier).digest();
    return this.base64Url(hash);
  }

  private base64Url(input: Buffer) {
    return input
      .toString('base64')
      .replace(/\+/g, '-')
      .replace(/\//g, '_')
      .replace(/=+$/g, '');
  }
}
