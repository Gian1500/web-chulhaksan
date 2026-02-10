import { BadRequestException, ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { MarkAttendanceDto } from './dto/mark-attendance.dto';
import { SaveGymAttendanceDto } from './dto/save-gym-attendance.dto';
import { UserRole } from '@prisma/client';

@Injectable()
export class AttendanceService {
  constructor(private readonly prisma: PrismaService) {}

  private parseDateOnly(raw: string) {
    // Enforce date-only semantics to keep @@unique([studentDni, date]) stable.
    const trimmed = (raw ?? '').trim();

    let iso = '';
    if (/^\d{4}-\d{2}-\d{2}$/.test(trimmed)) {
      iso = trimmed;
    } else {
      const m = trimmed.match(/^(\d{2})\/(\d{2})\/(\d{4})$/);
      if (m) {
        const dd = m[1];
        const mm = m[2];
        const yyyy = m[3];
        iso = `${yyyy}-${mm}-${dd}`;
      }
    }

    if (!iso) {
      throw new BadRequestException('La fecha debe tener formato AAAA-MM-DD o DD/MM/AAAA.');
    }

    const date = new Date(`${iso}T00:00:00.000Z`);
    if (Number.isNaN(date.getTime())) {
      throw new BadRequestException('Fecha invalida.');
    }
    return date;
  }

  async markAttendance(actor: { userId: string; role: UserRole }, dto: MarkAttendanceDto) {
    const student = await this.prisma.student.findUnique({
      where: { dni: dto.studentDni },
      select: { dni: true, gymId: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    // Teachers can only mark attendance for assigned students.
    if (actor.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: actor.userId },
        select: { id: true },
      });
      if (!teacher) {
        throw new ForbiddenException('No tenes permisos para marcar asistencias.');
      }

      const assigned = await this.prisma.studentTeacherAssignment.findFirst({
        where: { teacherId: teacher.id, studentDni: dto.studentDni, active: true },
        select: { id: true },
      });
      if (!assigned) {
        throw new ForbiddenException('No podes marcar asistencia para este alumno.');
      }
    }

    const date = this.parseDateOnly(dto.date);

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
        // Snapshot gym at marking time.
        gymId: student.gymId,
      },
      create: {
        studentDni: dto.studentDni,
        gymId: student.gymId,
        date,
        present: dto.present,
        notes: dto.notes ?? undefined,
      },
    } as any);
  }

  async listByStudent(actor: { userId: string; role: UserRole }, dni: string) {
    // Teachers can only view attendance for assigned students.
    if (actor.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: actor.userId },
        select: { id: true },
      });
      if (!teacher) {
        throw new ForbiddenException('No tenes permisos para ver asistencias.');
      }

      const assigned = await this.prisma.studentTeacherAssignment.findFirst({
        where: { teacherId: teacher.id, studentDni: dni, active: true },
        select: { id: true },
      });
      if (!assigned) {
        throw new ForbiddenException('No podes ver asistencias de este alumno.');
      }
    }

    return this.prisma.attendance.findMany({
      where: { studentDni: dni },
      orderBy: { date: 'desc' },
    });
  }

  async listForStudentMe(studentDni: string, query?: { from?: string; to?: string }) {
    const where: any = { studentDni };
    if (query?.from || query?.to) {
      where.date = {};
      if (query.from) where.date.gte = this.parseDateOnly(query.from);
      if (query.to) where.date.lte = this.parseDateOnly(query.to);
    }

    return this.prisma.attendance.findMany({
      where,
      orderBy: { date: 'desc' },
      take: 120,
      include: { gym: { select: { name: true } } },
    } as any);
  }

  async listByGym(
    actor: { userId: string; role: UserRole },
    gymId: string,
    rawDate: string,
  ) {
    const date = this.parseDateOnly(rawDate);

    const gym = await this.prisma.gym.findUnique({ where: { id: gymId }, select: { id: true, name: true } });
    if (!gym) {
      throw new NotFoundException('Gimnasio no encontrado.');
    }

    let studentWhere: any = { gymId };

    if (actor.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: actor.userId },
        select: { id: true },
      });
      if (!teacher) {
        throw new ForbiddenException('No tenes permisos para ver asistencias.');
      }

      studentWhere = {
        ...studentWhere,
        assignments: { some: { teacherId: teacher.id, active: true } },
      };
    }

    const students = await this.prisma.student.findMany({
      where: studentWhere,
      orderBy: [{ lastName: 'asc' }, { firstName: 'asc' }],
      select: { dni: true, firstName: true, lastName: true },
    });

    const dnis = students.map((s) => s.dni);
    const attendanceRows = dnis.length
      ? await this.prisma.attendance.findMany({
          where: { gymId, date, studentDni: { in: dnis } },
          select: { studentDni: true, present: true, notes: true },
        } as any)
      : [];

    const byDni = new Map(attendanceRows.map((r) => [r.studentDni, r]));

    const data = students.map((s) => {
      const row = byDni.get(s.dni);
      return {
        dni: s.dni,
        firstName: s.firstName,
        lastName: s.lastName,
        present: row?.present ?? false,
        notes: row?.notes ?? null,
        marked: Boolean(row),
      };
    });

    const presentCount = data.filter((x) => x.marked && x.present).length;
    const absentCount = data.filter((x) => x.marked && !x.present).length;
    const unmarkedCount = data.filter((x) => !x.marked).length;

    return {
      gym,
      date: rawDate,
      summary: {
        total: data.length,
        present: presentCount,
        absent: absentCount,
        unmarked: unmarkedCount,
      },
      students: data,
    };
  }

  async saveForGym(
    actor: { userId: string; role: UserRole },
    gymId: string,
    rawDate: string,
    dto: SaveGymAttendanceDto,
  ) {
    const date = this.parseDateOnly(rawDate);

    const gym = await this.prisma.gym.findUnique({ where: { id: gymId }, select: { id: true } });
    if (!gym) {
      throw new NotFoundException('Gimnasio no encontrado.');
    }

    let studentWhere: any = { gymId };

    if (actor.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: actor.userId },
        select: { id: true },
      });
      if (!teacher) {
        throw new ForbiddenException('No tenes permisos para guardar asistencias.');
      }

      studentWhere = {
        ...studentWhere,
        assignments: { some: { teacherId: teacher.id, active: true } },
      };
    }

    const students = await this.prisma.student.findMany({
      where: studentWhere,
      select: { dni: true },
    });
    const allowed = new Set(students.map((s) => s.dni));

    const itemsByDni = new Map<string, { present: boolean; notes?: string }>();
    for (const item of dto.items ?? []) {
      if (!allowed.has(item.studentDni)) {
        throw new ForbiddenException('No podes marcar asistencia para uno o mas alumnos de este gimnasio.');
      }
      itemsByDni.set(item.studentDni, { present: item.present, notes: item.notes });
    }

    const allowedList = Array.from(allowed);
    if (!allowedList.length) {
      return { ok: true, updated: 0, created: 0 };
    }

    const existing = await this.prisma.attendance.findMany({
      where: { studentDni: { in: allowedList }, date },
      select: { studentDni: true },
    });
    const existingSet = new Set(existing.map((e) => e.studentDni));

    const toCreate: any[] = [];
    const toUpdate: any[] = [];

    for (const dni of allowedList) {
      const item = itemsByDni.get(dni);
      const present = item?.present ?? false; // Explicit absent for unspecified students.
      const notes = item?.notes ?? null;

      if (existingSet.has(dni)) {
        toUpdate.push({ dni, present, notes });
      } else {
        toCreate.push({ studentDni: dni, gymId, date, present, notes });
      }
    }

    const result = await this.prisma.$transaction(async (tx) => {
      let created = 0;
      let updated = 0;

      if (toCreate.length) {
        const createdRes = await tx.attendance.createMany({ data: toCreate } as any);
        created = createdRes.count ?? toCreate.length;
      }

      if (toUpdate.length) {
        await Promise.all(
          toUpdate.map((u) =>
            tx.attendance.update({
              where: { studentDni_date: { studentDni: u.dni, date } },
              data: { gymId, present: u.present, notes: u.notes },
            } as any),
          ),
        );
        updated = toUpdate.length;
      }

      return { created, updated };
    });

    return { ok: true, ...result };
  }
}
