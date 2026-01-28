import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { FeeStatus, Prisma, UserRole } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { normalizeDni } from '../normalize';
import { GenerateFeesDto } from './dto/generate-fees.dto';
import { UpdateGlobalFeeDto } from './dto/update-global-fee.dto';

@Injectable()
export class FeesService {
  private readonly lateFeeAmount = new Prisma.Decimal(5000);

  constructor(private readonly prisma: PrismaService) {}

  private applyLateFee(fee: {
    amount: Prisma.Decimal;
    status: FeeStatus;
    dueDate: Date;
    paidAt: Date | null;
  }) {
    const referenceDate = fee.paidAt ?? new Date();
    const isLate = referenceDate > fee.dueDate;
    if (!isLate) {
      return { amount: fee.amount, lateFeeApplied: false };
    }
    return {
      amount: fee.amount.plus(this.lateFeeAmount),
      lateFeeApplied: true,
    };
  }

  async getGlobalFee() {
    return this.prisma.globalFeeSetting.findFirst({
      where: { isActive: true },
      orderBy: { createdAt: 'desc' },
    });
  }

  async updateGlobalFee(dto: UpdateGlobalFeeDto) {
    const monthlyAmount = new Prisma.Decimal(dto.monthlyAmount);
    const currency = dto.currency ?? 'ARS';

    return this.prisma.$transaction(async (tx) => {
      await tx.globalFeeSetting.updateMany({
        where: { isActive: true },
        data: { isActive: false },
      });

      return tx.globalFeeSetting.create({
        data: {
          monthlyAmount,
          currency,
          isActive: true,
        },
      });
    });
  }

  async listMyFees(dni: string) {
    const fees = await this.prisma.monthlyFee.findMany({
      where: { studentDni: dni },
      include: { payments: true },
      orderBy: [{ year: 'desc' }, { month: 'desc' }],
    });

    return fees.map((fee) => {
      const applied = this.applyLateFee(fee);
      return {
        ...fee,
        amount: applied.amount,
        lateFeeApplied: applied.lateFeeApplied,
      };
    });
  }

  async listFeesByStudent(user: { role: UserRole; sub?: string }, dni: string) {
    const normalizedDni = normalizeDni(dni);
    if (user.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: user.sub },
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
        throw new BadRequestException('No tienes permisos para este alumno.');
      }
    }

    const fees = await this.prisma.monthlyFee.findMany({
      where: { studentDni: normalizedDni },
      include: { payments: true },
      orderBy: [{ year: 'desc' }, { month: 'desc' }],
    });

    return fees.map((fee) => {
      const applied = this.applyLateFee(fee);
      return {
        ...fee,
        amount: applied.amount,
        lateFeeApplied: applied.lateFeeApplied,
      };
    });
  }

  async generateMonthlyFees(dto: GenerateFeesDto) {
    const activeFee = await this.getGlobalFee();
    if (!activeFee) {
      throw new BadRequestException('No hay cuota global activa.');
    }

    const now = new Date();
    const month = dto.month ?? now.getMonth() + 1;
    const year = dto.year ?? now.getFullYear();
    const dueDate = new Date(year, month - 1, 10);

    const students = await this.prisma.student.findMany({
      select: { dni: true },
    });

    if (students.length === 0) {
      return { created: 0 };
    }

    const data = students.map((student) => ({
      studentDni: student.dni,
      month,
      year,
      amount: activeFee.monthlyAmount,
      status: FeeStatus.PENDING,
      dueDate,
    }));

    const result = await this.prisma.monthlyFee.createMany({
      data,
      skipDuplicates: true,
    });

    return { created: result.count };
  }

  async markFeePaid(id: string, user: { role: UserRole; sub?: string }) {
    if (user.role !== UserRole.TEACHER && user.role !== UserRole.ADMIN) {
      throw new BadRequestException('No tienes permisos.');
    }

    const fee = await this.prisma.monthlyFee.findUnique({
      where: { id },
    });

    if (!fee) {
      throw new NotFoundException('Cuota no encontrada.');
    }

    if (fee.status === FeeStatus.PAID) {
      return fee;
    }

    if (user.role === UserRole.TEACHER) {
      const teacher = await this.prisma.teacher.findUnique({
        where: { userId: user.sub },
        select: { id: true },
      });

      if (!teacher) {
        throw new NotFoundException('Profesor no encontrado.');
      }

      const assignment = await this.prisma.studentTeacherAssignment.findFirst({
        where: {
          studentDni: fee.studentDni,
          teacherId: teacher.id,
          active: true,
        },
      });

      if (!assignment) {
        throw new BadRequestException('El alumno no esta asignado a este profesor.');
      }
    }

    return this.prisma.$transaction(async (tx) => {
      const updated = await tx.monthlyFee.update({
        where: { id },
        data: { status: FeeStatus.PAID, paidAt: new Date() },
      });

      await tx.payment.create({
        data: {
          feeId: id,
          status: 'APPROVED',
          rawResponse: { manual: true, method: 'cash' },
          paidAt: new Date(),
        },
      });

      return updated;
    });
  }
}
