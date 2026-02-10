import { BadRequestException, ForbiddenException, Injectable, NotFoundException } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { UserRole } from '@prisma/client';
import { normalizeDni } from '../normalize';
import { CreateFormLinkDto } from './dto/create-form-link.dto';
import { UpdateFormLinkDto } from './dto/update-form-link.dto';
import { SetStudentFormAccessDto } from './dto/set-student-form-access.dto';

@Injectable()
export class FormsService {
  constructor(private readonly prisma: PrismaService) {}

  async listForms() {
    return this.prisma.formLink.findMany({
      orderBy: [{ order: 'asc' }, { title: 'asc' }],
    });
  }

  async createForm(dto: CreateFormLinkDto) {
    const title = dto.title.trim();
    const url = dto.url.trim();
    if (!title) throw new BadRequestException('El título es obligatorio.');
    if (!url) throw new BadRequestException('La URL es obligatoria.');

    // If order isn't provided, append at the end (max+1) so teachers/admins don't need to care about it.
    let order = dto.order;
    if (order === undefined) {
      const agg = await this.prisma.formLink.aggregate({ _max: { order: true } });
      order = (agg._max.order ?? -1) + 1;
    }

    return this.prisma.formLink.create({
      data: { title, url, order },
    });
  }

  async updateForm(id: string, dto: UpdateFormLinkDto) {
    const existing = await this.prisma.formLink.findUnique({
      where: { id },
      select: { id: true },
    });
    if (!existing) throw new NotFoundException('Formulario no encontrado.');

    return this.prisma.formLink.update({
      where: { id },
      data: {
        title: dto.title?.trim() ?? undefined,
        url: dto.url?.trim() ?? undefined,
        order: dto.order ?? undefined,
      },
    });
  }

  async deleteForm(id: string) {
    const existing = await this.prisma.formLink.findUnique({
      where: { id },
      select: { id: true },
    });
    if (!existing) throw new NotFoundException('Formulario no encontrado.');

    await this.prisma.formLink.delete({ where: { id } });
    return { deleted: true };
  }

  async listMyForms(studentDni: string) {
    const normalizedDni = normalizeDni(studentDni);

    const forms = await this.prisma.formLink.findMany({
      where: {
        access: {
          some: { studentDni: normalizedDni },
        },
      },
      orderBy: [{ order: 'asc' }, { title: 'asc' }],
      select: { id: true, title: true, url: true, order: true },
    });

    return forms;
  }

  private async assertTeacherAccessToStudent(userId: string, studentDni: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });
    if (!teacher) throw new NotFoundException('Profesor no encontrado.');

    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        teacherId: teacher.id,
        studentDni,
        active: true,
      },
      select: { id: true },
    });
    if (!assignment) throw new ForbiddenException('No tienes permisos para este alumno.');

    return teacher.id;
  }

  async listFormsForStudent(
    user: { role: UserRole; sub?: string },
    studentDni: string,
  ) {
    const normalizedDni = normalizeDni(studentDni);

    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });
    if (!student) throw new NotFoundException('Alumno no encontrado.');

    if (user.role === UserRole.TEACHER) {
      await this.assertTeacherAccessToStudent(user.sub ?? '', normalizedDni);
    }

    const forms = await this.prisma.formLink.findMany({
      orderBy: [{ order: 'asc' }, { title: 'asc' }],
      include: {
        access: {
          where: { studentDni: normalizedDni },
          select: { id: true },
        },
      },
    });

    return forms.map((form) => ({
      id: form.id,
      title: form.title,
      url: form.url,
      order: form.order,
      unlocked: (form.access?.length ?? 0) > 0,
    }));
  }

  async setStudentFormAccess(
    user: { role: UserRole; sub?: string },
    studentDni: string,
    dto: SetStudentFormAccessDto,
  ) {
    const normalizedDni = normalizeDni(studentDni);

    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });
    if (!student) throw new NotFoundException('Alumno no encontrado.');

    const form = await this.prisma.formLink.findUnique({
      where: { id: dto.formId },
      select: { id: true },
    });
    if (!form) throw new NotFoundException('Formulario no encontrado.');

    let unlockedByTeacherId: string | null = null;
    if (user.role === UserRole.TEACHER) {
      unlockedByTeacherId = await this.assertTeacherAccessToStudent(
        user.sub ?? '',
        normalizedDni,
      );
    }

    if (dto.unlocked) {
      await this.prisma.studentFormAccess.upsert({
        where: {
          studentDni_formId: { studentDni: normalizedDni, formId: dto.formId },
        },
        create: {
          studentDni: normalizedDni,
          formId: dto.formId,
          unlockedByTeacherId: unlockedByTeacherId ?? undefined,
        },
        update: {
          unlockedAt: new Date(),
          unlockedByTeacherId: unlockedByTeacherId ?? undefined,
        },
      });
    } else {
      await this.prisma.studentFormAccess.deleteMany({
        where: { studentDni: normalizedDni, formId: dto.formId },
      });
    }

    return { ok: true };
  }
}
