import {
  BadRequestException,
  ConflictException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service';
import { CreateAdminUserDto } from './dto/create-admin-user.dto';
import { ListUsersDto } from './dto/list-users.dto';
import { UpdateUserStatusDto } from './dto/update-user-status.dto';
import { FeeStatus, Prisma, UserRole, UserStatus } from '@prisma/client';
import { hash } from 'bcryptjs';
import { randomBytes } from 'crypto';
import { normalizeDni } from '../normalize';
import { UpdateStudentDto } from '../students/dto/update-student.dto';
import { UpdateTeacherDto } from '../teachers/dto/update-teacher.dto';
import { CreateGymDto } from './dto/create-gym.dto';
import { UpdateGymDto } from './dto/update-gym.dto';
import { DeleteGymDto } from './dto/delete-gym.dto';
import { StudentCategory } from '@prisma/client';

@Injectable()
export class AdminService {
  constructor(private readonly prisma: PrismaService) {}

  async listGyms() {
    const gyms = await this.prisma.gym.findMany({
      where: { isArchived: false },
      select: {
        id: true,
        name: true,
        isArchived: true,
        _count: { select: { students: true } },
      },
      orderBy: { name: 'asc' },
    });

    return gyms.map((gym) => ({
      id: gym.id,
      name: gym.name,
      isArchived: gym.isArchived,
      studentsCount: gym._count.students,
    }));
  }

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
        {
          student: {
            firstName: {
              contains: filters.search,
              mode: Prisma.QueryMode.insensitive,
            },
          },
        },
        {
          student: {
            lastName: {
              contains: filters.search,
              mode: Prisma.QueryMode.insensitive,
            },
          },
        },
        {
          teacher: {
            firstName: {
              contains: filters.search,
              mode: Prisma.QueryMode.insensitive,
            },
          },
        },
        {
          teacher: {
            lastName: {
              contains: filters.search,
              mode: Prisma.QueryMode.insensitive,
            },
          },
        },
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

    if (dto.role === UserRole.TEACHER) {
      if (!dto.firstName?.trim() || !dto.lastName?.trim()) {
        throw new BadRequestException('Nombre y apellido son obligatorios.');
      }
      if (!dto.phone?.trim()) {
        throw new BadRequestException('El teléfono es obligatorio.');
      }
      if (!dto.birthDate?.trim()) {
        throw new BadRequestException('La fecha de nacimiento es obligatoria.');
      }
      if (!dto.gyms || dto.gyms.length === 0) {
        throw new BadRequestException(
          'Los gimnasios son obligatorios para profesores.',
        );
      }
    }
    if (dto.role === UserRole.STUDENT) {
      if (!dto.gymId?.trim()) {
        throw new BadRequestException('El gimnasio es obligatorio.');
      }
      if (!dto.category) {
        throw new BadRequestException('Debes seleccionar si el alumno es Adulto o Infantil.');
      }
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
    const firstName =
      dto.firstName?.trim() || (dto.role === UserRole.STUDENT ? 'Sin nombre' : '');
    const lastName =
      dto.lastName?.trim() || (dto.role === UserRole.STUDENT ? 'Sin apellido' : '');
    const email = dto.email?.trim() || null;
    const phone = dto.phone?.trim() || null;
    const guardianPhone = dto.guardianPhone?.trim() || null;
    const gymId = dto.gymId?.trim() || null;
    const category = dto.category ?? StudentCategory.ADULT;
    const address = dto.address?.trim() || null;
    const birthDateValue = dto.birthDate?.trim();

    return this.prisma.$transaction(async (tx) => {
      const user = await tx.user.create({
        data: {
          dni: normalizedDni,
          passwordHash,
          role: dto.role,
          status: UserStatus.ACTIVE,
          mustChangePassword: true,
        },
      });

      if (dto.role === UserRole.STUDENT) {
        const resolvedGym = gymId
          ? await tx.gym.findFirst({
              where: { id: gymId, isArchived: false },
              select: { id: true },
            })
          : null;
        if (!resolvedGym) {
          throw new BadRequestException('El gimnasio es inválido.');
        }
        await tx.student.create({
          data: {
            dni: normalizedDni,
            userId: user.id,
            firstName,
            lastName,
            category,
            email,
            phone,
            guardianPhone,
            gymId: resolvedGym.id,
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
        const dueDate =
          now.getDate() > 10
            ? new Date(year, month, 0)
            : new Date(year, month - 1, 10);
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
      }

      if (dto.role === UserRole.TEACHER) {
        await tx.teacher.create({
          data: {
            userId: user.id,
            firstName,
            lastName,
            email,
            phone,
            birthDate: birthDateValue ? new Date(birthDateValue) : undefined,
            address,
            gyms: dto.gyms ?? [],
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

  async resetUserPassword(userId: string) {
    const user = await this.prisma.user.findUnique({
      where: { id: userId },
      select: { id: true },
    });
    if (!user) {
      throw new NotFoundException('Usuario no encontrado.');
    }

    const temporaryPassword = `CHS-${randomBytes(4).toString('hex')}`;
    const passwordHash = await hash(temporaryPassword, 10);

    await this.prisma.user.update({
      where: { id: userId },
      data: { passwordHash, mustChangePassword: true },
    });

    return { temporaryPassword };
  }

  async listStudents(params?: { page?: number; limit?: number; search?: string; gymId?: string; category?: StudentCategory }) {
    const page = Math.max(1, params?.page ?? 1);
    const limit = Math.max(1, params?.limit ?? 10);
    const skip = (page - 1) * limit;
    const search = params?.search?.trim();

    const where: Prisma.StudentWhereInput | undefined =
      search || params?.gymId || params?.category
        ? {
            ...(params?.gymId ? { gymId: params.gymId } : {}),
            ...(params?.category ? { category: params.category } : {}),
            ...(search
              ? {
                  OR: [
                    { dni: { contains: search } },
                    { firstName: { contains: search, mode: Prisma.QueryMode.insensitive } },
                    { lastName: { contains: search, mode: Prisma.QueryMode.insensitive } },
                  ],
                }
              : {}),
          }
        : undefined;

    const [total, data] = await this.prisma.$transaction([
      this.prisma.student.count({ where }),
      this.prisma.student.findMany({
        where,
        include: {
          user: {
            select: { id: true, status: true, createdAt: true },
          },
          gym: {
            select: { name: true },
          },
          assignments: {
            where: { active: true },
            include: {
              teacher: {
                select: { id: true, firstName: true, lastName: true },
              },
            },
            orderBy: { startAt: 'desc' },
          },
        },
        orderBy: { createdAt: 'desc' },
        skip,
        take: limit,
      }),
    ]);

    // Normalize gym shape for the frontend (string name instead of nested relation object).
    const normalized = data.map((student) => {
      const { gym, ...rest } = student;
      return { ...rest, gym: gym?.name ?? null };
    });

    return { data: normalized, total, page, limit };
  }

  async listTeachers(params?: { page?: number; limit?: number; search?: string }) {
    const page = Math.max(1, params?.page ?? 1);
    const limit = Math.max(1, params?.limit ?? 10);
    const skip = (page - 1) * limit;
    const search = params?.search?.trim();

    const where: Prisma.TeacherWhereInput | undefined = search
      ? {
          OR: [
            { firstName: { contains: search, mode: Prisma.QueryMode.insensitive } },
            { lastName: { contains: search, mode: Prisma.QueryMode.insensitive } },
            { user: { dni: { contains: search } } },
          ],
        }
      : undefined;

    const [total, data] = await this.prisma.$transaction([
      this.prisma.teacher.count({ where }),
      this.prisma.teacher.findMany({
        where,
        include: {
          user: {
            select: { id: true, dni: true, status: true, createdAt: true },
          },
        },
        orderBy: { createdAt: 'desc' },
        skip,
        take: limit,
      }),
    ]);

    return { data, total, page, limit };
  }

  async deleteStudent(dni: string) {
    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true, userId: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
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

  async deleteTeacher(id: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { id },
      select: { id: true, userId: true },
    });
    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    await this.prisma.$transaction(async (tx) => {
      await tx.studentTeacherAssignment.deleteMany({
        where: { teacherId: id },
      });
      await tx.studentTeacherRequest.deleteMany({
        where: { teacherId: id },
      });
      await tx.teacher.delete({ where: { id } });
      await tx.user.delete({ where: { id: teacher.userId } });
    });

    return { deleted: true };
  }

  async assignStudentTeacher(dni: string, teacherId: string) {
    if (!teacherId) {
      throw new BadRequestException('Profesor inválido.');
    }

    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const teacher = await this.prisma.teacher.findUnique({
      where: { id: teacherId },
      select: { id: true },
    });
    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const current = await this.prisma.studentTeacherAssignment.findFirst({
      where: { studentDni: normalizedDni, active: true },
      orderBy: { startAt: 'desc' },
    });

    if (current?.teacherId === teacherId) {
      return current;
    }

    return this.prisma.$transaction(async (tx) => {
      if (current) {
        await tx.studentTeacherAssignment.update({
          where: { id: current.id },
          data: { active: false, endAt: new Date() },
        });
      }
      return tx.studentTeacherAssignment.create({
        data: { studentDni: normalizedDni, teacherId },
      });
    });
  }

  async unassignStudentTeacher(dni: string) {
    const normalizedDni = normalizeDni(dni);
    const student = await this.prisma.student.findUnique({
      where: { dni: normalizedDni },
      select: { dni: true },
    });
    if (!student) {
      throw new NotFoundException('Alumno no encontrado.');
    }

    const current = await this.prisma.studentTeacherAssignment.findFirst({
      where: { studentDni: normalizedDni, active: true },
      orderBy: { startAt: 'desc' },
    });

    if (!current) {
      return { unassigned: false };
    }

    await this.prisma.studentTeacherAssignment.update({
      where: { id: current.id },
      data: { active: false, endAt: new Date() },
    });

    return { unassigned: true };
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

    const hasGymField = Object.prototype.hasOwnProperty.call(dto, 'gymId');
    const nextGymId = hasGymField ? (dto.gymId ?? null) : undefined;
    const nextGym = dto.gymId
      ? await this.prisma.gym.findFirst({
          where: { id: dto.gymId, isArchived: false },
          select: { id: true },
        })
      : null;
    if (dto.gymId && !nextGym) {
      throw new BadRequestException('El gimnasio es inválido.');
    }

    return this.prisma.student.update({
      where: { dni: normalizedDni },
      data: {
        firstName: dto.firstName ?? undefined,
        lastName: dto.lastName ?? undefined,
        category: dto.category ?? undefined,
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
        birthDate: dto.birthDate
          ? new Date(dto.birthDate)
          : dto.birthDate === null
            ? null
            : undefined,
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
        firstName: dto.firstName ?? undefined,
        lastName: dto.lastName ?? undefined,
        email: dto.email ?? undefined,
        phone: dto.phone ?? undefined,
        address: dto.address ?? undefined,
        birthDate: dto.birthDate
          ? new Date(dto.birthDate)
          : dto.birthDate === null
            ? null
            : undefined,
        gyms: dto.gyms === null ? [] : dto.gyms ?? undefined,
      },
    });
  }

  async createGym(dto: CreateGymDto) {
    const name = dto.name.trim();
    if (!name) {
      throw new BadRequestException('El nombre del gimnasio es obligatorio.');
    }

    try {
      return await this.prisma.gym.create({
        data: { name },
        select: { id: true, name: true },
      });
    } catch (err: any) {
      // Unique constraint: Gym.name
      if (err?.code === 'P2002') {
        throw new ConflictException('Ya existe un gimnasio con ese nombre.');
      }
      throw err;
    }
  }

  async renameGym(id: string, dto: UpdateGymDto) {
    const name = dto.name.trim();
    if (!name) {
      throw new BadRequestException('El nombre del gimnasio es obligatorio.');
    }

    const gym = await this.prisma.gym.findUnique({
      where: { id },
      select: { id: true },
    });
    if (!gym) {
      throw new NotFoundException('Gimnasio no encontrado.');
    }

    try {
      return await this.prisma.gym.update({
        where: { id },
        data: { name },
        select: { id: true, name: true },
      });
    } catch (err: any) {
      if (err?.code === 'P2002') {
        throw new ConflictException('Ya existe un gimnasio con ese nombre.');
      }
      throw err;
    }
  }

  async deleteGym(id: string, dto: DeleteGymDto) {
    const targetGymId = dto?.targetGymId?.trim();

    if (targetGymId && id === targetGymId) {
      throw new BadRequestException(
        'El gimnasio destino debe ser diferente al gimnasio a eliminar.',
      );
    }

    const [sourceGym, targetGym] = await Promise.all([
      this.prisma.gym.findUnique({
        where: { id },
        select: { id: true, name: true, isArchived: true },
      }),
      targetGymId
        ? this.prisma.gym.findFirst({
            where: { id: targetGymId, isArchived: false },
            select: { id: true, name: true },
          })
        : Promise.resolve(null),
    ]);

    if (!sourceGym) {
      throw new NotFoundException('Gimnasio no encontrado.');
    }
    if (sourceGym.isArchived) {
      throw new BadRequestException('El gimnasio ya esta archivado.');
    }
    if (targetGymId && !targetGym) {
      throw new NotFoundException('Gimnasio destino no encontrado.');
    }

    const migrated = await this.prisma.$transaction(async (tx) => {
      const movedStudents = await tx.student.updateMany({
        where: { gymId: sourceGym.id },
        data: { gymId: targetGym?.id ?? null },
      });

      await tx.gym.update({
        where: { id: sourceGym.id },
        data: { isArchived: true },
      });

      return {
        students: movedStudents.count,
      };
    });

    return {
      archived: true,
      sourceGym,
      targetGym: targetGym ?? null,
      migratedStudents: migrated.students,
      unassignedStudents: targetGym ? 0 : migrated.students,
    };
  }

}
