import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { FeeStatus, Prisma, UserRole } from '@prisma/client';
import { PrismaService } from '../prisma/prisma.service';
import { GenerateFeesDto } from './dto/generate-fees.dto';
import { UpdateGlobalFeeDto } from './dto/update-global-fee.dto';

@Injectable()
export class FeesService {
  constructor(private readonly prisma: PrismaService) {}

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
    return this.prisma.monthlyFee.findMany({
      where: { studentDni: dni },
      include: { payments: true },
      orderBy: [{ year: 'desc' }, { month: 'desc' }],
    });
  }

  async listFeesByStudent(dni: string) {
    return this.prisma.monthlyFee.findMany({
      where: { studentDni: dni },
      include: { payments: true },
      orderBy: [{ year: 'desc' }, { month: 'desc' }],
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

  async markFeePaid(id: string, userRole: UserRole) {
    if (userRole !== UserRole.TEACHER && userRole !== UserRole.ADMIN) {
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

    return this.prisma.$transaction(async (tx) => {
      const updated = await tx.monthlyFee.update({
        where: { id },
        data: { status: FeeStatus.PAID, paidAt: new Date() },
      });

      await tx.payment.create({
        data: {
          feeId: id,
          status: 'APPROVED',
          rawResponse: { manual: true },
          paidAt: new Date(),
        },
      });

      return updated;
    });
  }
}
