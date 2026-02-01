import {
  BadRequestException,
  ForbiddenException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { FeeStatus, PaymentStatus, Prisma, UserRole } from '@prisma/client';
import { MercadoPagoConfig, Payment, Preference } from 'mercadopago';
import QRCode from 'qrcode';
import { createHmac, timingSafeEqual } from 'crypto';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePaymentDto } from './dto/create-payment.dto';

@Injectable()
export class PaymentsService {
  private readonly lateFeeAmount = new Prisma.Decimal(5000);

  constructor(private readonly prisma: PrismaService) {}

  private getMpClient(accessToken: string) {
    return new MercadoPagoConfig({ accessToken });
  }

  private applyLateFee(fee: { amount: Prisma.Decimal; dueDate: Date }, referenceDate?: Date) {
    const reference = referenceDate ?? new Date();
    const isLate = reference > fee.dueDate;
    if (!isLate) return fee.amount;
    return fee.amount.plus(this.lateFeeAmount);
  }

  private async getTeacherForFee(studentDni: string) {
    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni,
        active: true,
      },
      include: { teacher: true },
    });

    if (!assignment?.teacher) {
      throw new BadRequestException('El alumno no tiene profesor asignado.');
    }

    const accessToken = assignment.teacher.mpAccessToken;
    if (!accessToken) {
      throw new BadRequestException(
        'El profesor no tiene Mercado Pago conectado.',
      );
    }

    return { ...assignment.teacher, mpAccessToken: accessToken };
  }

  private async assertTeacherAssignment(userId: string, studentDni: string) {
    const teacher = await this.prisma.teacher.findUnique({
      where: { userId },
      select: { id: true },
    });
    if (!teacher) {
      throw new NotFoundException('Profesor no encontrado.');
    }

    const assignment = await this.prisma.studentTeacherAssignment.findFirst({
      where: {
        studentDni,
        teacherId: teacher.id,
        active: true,
      },
    });

    if (!assignment) {
      throw new ForbiddenException('No tienes permisos para este alumno.');
    }

    return teacher.id;
  }

  async createPayment(user: any, dto: CreatePaymentDto) {
    const fee = await this.prisma.monthlyFee.findUnique({
      where: { id: dto.feeId },
      include: { student: true },
    });

    if (!fee) {
      throw new NotFoundException('Cuota no encontrada.');
    }

    if (fee.status === FeeStatus.PAID) {
      throw new BadRequestException('La cuota ya esta pagada.');
    }

    if (user.role === UserRole.STUDENT && user.dni !== fee.studentDni) {
      throw new BadRequestException('No tienes permisos para esta cuota.');
    }
    if (user.role === UserRole.TEACHER) {
      await this.assertTeacherAssignment(user.sub, fee.studentDni);
    }

    const teacher = await this.getTeacherForFee(fee.studentDni);

    const existingPayment = await this.prisma.payment.findFirst({
      where: { feeId: dto.feeId, status: PaymentStatus.PENDING },
      orderBy: { createdAt: 'desc' },
    });
    const payment =
      existingPayment ??
      (await this.prisma.payment.create({
        data: {
          feeId: dto.feeId,
          status: PaymentStatus.PENDING,
        },
      }));

    const mpClient = this.getMpClient(teacher.mpAccessToken);
    const preference = new Preference(mpClient);
    const rawSuccess = process.env.MP_BACK_URL_SUCCESS?.trim();
    const rawFailure = process.env.MP_BACK_URL_FAILURE?.trim();
    const rawPending = process.env.MP_BACK_URL_PENDING?.trim();
    const isValidUrl = (value?: string) => {
      if (!value) return false;
      try {
        new URL(value);
        return true;
      } catch {
        return false;
      }
    };
    const backUrlsConfig = {
      success: isValidUrl(rawSuccess) ? rawSuccess : undefined,
      failure: isValidUrl(rawFailure) ? rawFailure : undefined,
      pending: isValidUrl(rawPending) ? rawPending : undefined,
    };
    const backUrls = backUrlsConfig.success ? backUrlsConfig : undefined;
    const canAutoReturn =
      !!backUrlsConfig.success &&
      backUrlsConfig.success.startsWith('https://') &&
      !backUrlsConfig.success.includes('localhost');
    const notificationUrl = process.env.MP_WEBHOOK_URL;
    const notificationWithTeacher = notificationUrl
      ? `${notificationUrl}?teacherId=${teacher.id}`
      : undefined;
    const amount = this.applyLateFee(fee);

    const itemDescription =
      process.env.MP_ITEM_DESCRIPTION?.trim() ??
      `Cuota mensual ${fee.month}/${fee.year}`;
    const categoryId = process.env.MP_ITEM_CATEGORY_ID?.trim();
    const rawStatementDescriptor = process.env.MP_STATEMENT_DESCRIPTOR?.trim();
    const statementDescriptor = rawStatementDescriptor
      ? rawStatementDescriptor.slice(0, 13)
      : undefined;

    const preferenceBody = {
        items: [
          {
            id: fee.id,
            title: `Cuota ${fee.month}/${fee.year}`,
            description: itemDescription,
            ...(categoryId ? { category_id: categoryId } : {}),
            quantity: 1,
            currency_id: 'ARS',
            unit_price: Number(amount),
          },
        ],
        payer: fee.student?.email ? { email: fee.student.email } : undefined,
        back_urls: backUrls,
        notification_url: notificationWithTeacher,
        ...(canAutoReturn ? { auto_return: 'approved' } : {}),
        ...(statementDescriptor
          ? { statement_descriptor: statementDescriptor }
          : {}),
        external_reference: payment.id,
        metadata: {
          paymentId: payment.id,
          feeId: fee.id,
          studentDni: fee.studentDni,
          teacherId: teacher.id,
        },
      };

    const response = await preference.create({
      body: preferenceBody,
    });

    const rawResponse = JSON.parse(JSON.stringify(response)) as Prisma.InputJsonValue;

    await this.prisma.payment.update({
      where: { id: payment.id },
      data: {
        mpPreferenceId: response.id,
        rawResponse,
      },
    });

    const preferSandbox =
      (process.env.MP_OAUTH_TEST_TOKEN ?? '').toLowerCase() === 'true';
    const initPoint = preferSandbox
      ? response.sandbox_init_point ?? response.init_point
      : response.init_point;

    return {
      paymentId: payment.id,
      mpPreferenceId: response.id,
      initPoint,
    };
  }

  async createQrForFee(user: any, feeId: string) {
    const payment = await this.createPayment(user, { feeId });
    const dataUrl = await QRCode.toDataURL(payment.initPoint);

    return {
      paymentId: payment.paymentId,
      mpPreferenceId: payment.mpPreferenceId,
      qrDataUrl: dataUrl,
    };
  }

  async getPaymentDetails(user: any, paymentId: string) {
    const payment = await this.prisma.payment.findUnique({
      where: { id: paymentId },
      include: {
        fee: {
          include: { student: true },
        },
      },
    });

    if (!payment) {
      throw new NotFoundException('Pago no encontrado.');
    }

    if (
      user.role === UserRole.STUDENT &&
      payment.fee.studentDni !== user.dni
    ) {
      throw new ForbiddenException('No tienes permisos para este pago.');
    }
    if (user.role === UserRole.TEACHER) {
      await this.assertTeacherAssignment(user.sub, payment.fee.studentDni);
    }

    const paymentMethod = this.extractPaymentMethod(payment.rawResponse);
    const displayAmount = this.applyLateFee(
      payment.fee,
      payment.paidAt ?? undefined,
    );
    const lateFeeApplied = displayAmount.toString() !== payment.fee.amount.toString();

    return {
      id: payment.id,
      status: payment.status,
      paidAt: payment.paidAt,
      createdAt: payment.createdAt,
      mpPaymentId: payment.mpPaymentId,
      mpPreferenceId: payment.mpPreferenceId,
      paymentMethod,
      fee: {
        id: payment.fee.id,
        month: payment.fee.month,
        year: payment.fee.year,
        amount: displayAmount,
        lateFeeApplied,
        student: payment.fee.student
          ? {
              dni: payment.fee.student.dni,
              firstName: payment.fee.student.firstName,
              lastName: payment.fee.student.lastName,
            }
          : null,
      },
    };
  }

  async handleWebhook(payload: any) {
    return this.handleWebhookWithTeacher(payload);
  }

  async handleWebhookWithTeacher(
    payload: any,
    teacherId?: string,
    context?: { headers?: Record<string, any>; query?: Record<string, any> },
  ) {
    if (context?.headers) {
      const isValid = this.validateWebhookSignature(
        context.headers,
        context.query ?? {},
        payload,
      );
      if (!isValid) {
        throw new BadRequestException('Firma de webhook inválida.');
      }
    }
    const direct = payload?.mpPaymentId && payload?.feeId && payload?.status;
    if (direct) {
      return this.upsertPaymentFromWebhook({
        mpPaymentId: payload.mpPaymentId,
        feeId: payload.feeId,
        status: payload.status,
        raw: payload.raw ?? payload,
      });
    }

    const mpPaymentId = payload?.data?.id ?? payload?.id;
    if (!mpPaymentId) {
      throw new BadRequestException('Webhook inválido.');
    }
    const resolvedTeacherId = teacherId ?? payload?.teacherId ?? null;
    if (!resolvedTeacherId) {
      throw new BadRequestException('teacherId no proporcionado en el webhook.');
    }
    const teacher = await this.prisma.teacher.findUnique({
      where: { id: resolvedTeacherId },
      select: { mpAccessToken: true },
    });
    if (!teacher?.mpAccessToken) {
      throw new BadRequestException('Mercado Pago del profesor no configurado.');
    }
    const paymentClient = new Payment(this.getMpClient(teacher.mpAccessToken));
    const mpPayment = await paymentClient.get({ id: mpPaymentId });
    const status = this.mapMpStatus(mpPayment.status);
    const referenceId =
      mpPayment.metadata?.paymentId ??
      mpPayment.external_reference ??
      mpPayment.metadata?.feeId ??
      null;

    if (!referenceId) {
      throw new BadRequestException('No se encontró referencia en el pago.');
    }

    return this.upsertPaymentFromWebhook({
      mpPaymentId: String(mpPaymentId),
      referenceId: String(referenceId),
      status,
      raw: mpPayment,
    });
  }

  private async upsertPaymentFromWebhook(input: {
    mpPaymentId: string;
    status: PaymentStatus;
    raw: any;
    feeId?: string;
    referenceId?: string;
  }) {
    const paidAt =
      input.status === PaymentStatus.APPROVED ? new Date() : undefined;

    if (input.referenceId) {
      const existingById = await this.prisma.payment.findUnique({
        where: { id: input.referenceId },
      });
      if (existingById) {
        const shouldUpdate =
          existingById.status !== input.status ||
          (input.status === PaymentStatus.APPROVED && !existingById.paidAt) ||
          (!!input.mpPaymentId &&
            existingById.mpPaymentId !== input.mpPaymentId);

        if (!shouldUpdate) {
          return existingById;
        }

        const updated = await this.prisma.payment.update({
          where: { id: existingById.id },
          data: {
            status: input.status,
            rawResponse: input.raw ?? undefined,
            paidAt,
            mpPaymentId: input.mpPaymentId ?? existingById.mpPaymentId,
          },
        });

        if (
          input.status === PaymentStatus.APPROVED &&
          existingById.status !== PaymentStatus.APPROVED
        ) {
          await this.prisma.monthlyFee.update({
            where: { id: existingById.feeId },
            data: { status: FeeStatus.PAID, paidAt: new Date() },
          });
        }

        return updated;
      }
    }

    const existingByMp = await this.prisma.payment.findUnique({
      where: { mpPaymentId: input.mpPaymentId },
    });
    if (existingByMp) {
      const shouldUpdate =
        existingByMp.status !== input.status ||
        (input.status === PaymentStatus.APPROVED && !existingByMp.paidAt);

      if (!shouldUpdate) {
        return existingByMp;
      }

      const updated = await this.prisma.payment.update({
        where: { id: existingByMp.id },
        data: {
          status: input.status,
          rawResponse: input.raw ?? undefined,
          paidAt,
        },
      });

      if (
        input.status === PaymentStatus.APPROVED &&
        existingByMp.status !== PaymentStatus.APPROVED
      ) {
        await this.prisma.monthlyFee.update({
          where: { id: existingByMp.feeId },
          data: { status: FeeStatus.PAID, paidAt: new Date() },
        });
      }

      return updated;
    }

    const feeId = input.feeId ?? input.referenceId;
    if (!feeId) {
      throw new BadRequestException('No se encontró feeId válido.');
    }

    const fee = await this.prisma.monthlyFee.findUnique({
      where: { id: feeId },
      select: { id: true, status: true },
    });
    if (!fee) {
      throw new BadRequestException('FeeId inválido.');
    }

    const created = await this.prisma.payment.create({
      data: {
        feeId,
        mpPaymentId: input.mpPaymentId,
        status: input.status,
        rawResponse: input.raw ?? undefined,
        paidAt,
      },
    });

    if (input.status === PaymentStatus.APPROVED && fee.status !== FeeStatus.PAID) {
      await this.prisma.monthlyFee.update({
        where: { id: feeId },
        data: { status: FeeStatus.PAID, paidAt: new Date() },
      });
    }

    return created;
  }

  private validateWebhookSignature(
    headers: Record<string, any>,
    query: Record<string, any>,
    payload: any,
  ) {
    const secret = process.env.MP_WEBHOOK_SECRET?.trim();
    if (!secret) {
      return true;
    }

    const signatureHeader = String(
      headers['x-signature'] ??
        headers['X-Signature'] ??
        headers['x-signature'.toLowerCase()] ??
        '',
    );
    const requestId = String(
      headers['x-request-id'] ??
        headers['X-Request-Id'] ??
        headers['x-request-id'.toLowerCase()] ??
        '',
    );

    if (!signatureHeader || !requestId) {
      return false;
    }

    const parts = signatureHeader.split(',').map((part) => part.trim());
    const tsPart = parts.find((part) => part.startsWith('ts='));
    const v1Part = parts.find((part) => part.startsWith('v1='));
    if (!tsPart || !v1Part) {
      return false;
    }

    const ts = tsPart.replace('ts=', '');
    const signature = v1Part.replace('v1=', '');

    const rawDataId =
      (query['data.id'] as string | undefined) ??
      payload?.data?.id ??
      payload?.id ??
      '';
    if (!rawDataId) {
      return false;
    }

    const dataId = String(rawDataId).toLowerCase();
    const manifest = `id:${dataId};request-id:${requestId};ts:${ts};`;
    const hash = createHmac('sha256', secret).update(manifest).digest('hex');

    const hashBuf = Buffer.from(hash, 'hex');
    const sigBuf = Buffer.from(signature, 'hex');
    if (hashBuf.length !== sigBuf.length) {
      return false;
    }

    const toleranceSec = Number(process.env.MP_WEBHOOK_TOLERANCE_SEC ?? 300);
    const tsValue = Number(ts);
    if (Number.isFinite(tsValue) && toleranceSec > 0) {
      const tsMs = ts.length > 10 ? tsValue : tsValue * 1000;
      const drift = Math.abs(Date.now() - tsMs) / 1000;
      if (drift > toleranceSec) {
        return false;
      }
    }

    return timingSafeEqual(hashBuf, sigBuf);
  }

  private mapMpStatus(status?: string): PaymentStatus {
    if (!status) return PaymentStatus.PENDING;
    if (status === 'approved') return PaymentStatus.APPROVED;
    if (status === 'rejected' || status === 'cancelled') {
      return PaymentStatus.REJECTED;
    }
    return PaymentStatus.PENDING;
  }

  private extractPaymentMethod(raw: unknown) {
    if (!raw || typeof raw !== 'object') {
      return null;
    }
    const data = raw as Record<string, any>;
    if (data.manual && data.method === 'cash') {
      return {
        id: 'cash',
        name: 'Efectivo',
        type: 'cash',
        last4: null,
      };
    }
    const paymentMethod = data.payment_method ?? null;
    const card = data.card ?? null;

    const methodId =
      data.payment_method_id ?? paymentMethod?.id ?? paymentMethod?.name ?? null;
    const methodName =
      paymentMethod?.name ?? data.payment_method_id ?? null;
    const methodType = data.payment_type_id ?? null;
    const last4 = card?.last_four_digits ?? null;

    return {
      id: methodId,
      name: methodName,
      type: methodType,
      last4,
    };
  }
}
