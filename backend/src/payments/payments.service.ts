import {
  BadRequestException,
  Injectable,
  NotFoundException,
} from '@nestjs/common';
import { FeeStatus, PaymentStatus, UserRole } from '@prisma/client';
import { MercadoPagoConfig, Payment, Preference } from 'mercadopago';
import QRCode from 'qrcode';
import { PrismaService } from '../prisma/prisma.service';
import { CreatePaymentDto } from './dto/create-payment.dto';

@Injectable()
export class PaymentsService {
  private readonly mpClient?: MercadoPagoConfig;

  constructor(private readonly prisma: PrismaService) {
    const accessToken = process.env.MP_ACCESS_TOKEN;
    if (accessToken) {
      this.mpClient = new MercadoPagoConfig({ accessToken });
    }
  }

  async createPayment(user: any, dto: CreatePaymentDto) {
    if (!this.mpClient) {
      throw new BadRequestException('MP_ACCESS_TOKEN no configurado.');
    }
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

    const payment = await this.prisma.payment.create({
      data: {
        feeId: dto.feeId,
        status: PaymentStatus.PENDING,
      },
    });

    const preference = new Preference(this.mpClient);
    const backUrlsConfig = {
      success: process.env.MP_BACK_URL_SUCCESS,
      failure: process.env.MP_BACK_URL_FAILURE,
      pending: process.env.MP_BACK_URL_PENDING,
    };
    const backUrls = Object.values(backUrlsConfig).every(Boolean)
      ? backUrlsConfig
      : undefined;
    const notificationUrl = process.env.MP_WEBHOOK_URL;

    const response = await preference.create({
      body: {
        items: [
          {
            id: fee.id,
            title: `Cuota ${fee.month}/${fee.year}`,
            quantity: 1,
            currency_id: 'ARS',
            unit_price: Number(fee.amount),
          },
        ],
        payer: fee.student?.email ? { email: fee.student.email } : undefined,
        back_urls: backUrls,
        notification_url: notificationUrl,
        auto_return: 'approved',
        external_reference: payment.id,
        metadata: {
          feeId: fee.id,
          studentDni: fee.studentDni,
        },
      },
    });

    await this.prisma.payment.update({
      where: { id: payment.id },
      data: {
        mpPreferenceId: response.id,
        rawResponse: response,
      },
    });

    return {
      paymentId: payment.id,
      mpPreferenceId: response.id,
      initPoint: response.init_point,
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

  async handleWebhook(payload: any) {
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
      throw new BadRequestException('Webhook invalido.');
    }

    if (!this.mpClient) {
      throw new BadRequestException('MP_ACCESS_TOKEN no configurado.');
    }
    const paymentClient = new Payment(this.mpClient);
    const mpPayment = await paymentClient.get({ id: mpPaymentId });
    const status = this.mapMpStatus(mpPayment.status);
    const feeId =
      mpPayment.metadata?.feeId ?? mpPayment.external_reference ?? null;

    if (!feeId) {
      throw new BadRequestException('No se encontro feeId en el pago.');
    }

    return this.upsertPaymentFromWebhook({
      mpPaymentId: String(mpPaymentId),
      feeId: String(feeId),
      status,
      raw: mpPayment,
    });
  }

  private async upsertPaymentFromWebhook(input: {
    mpPaymentId: string;
    feeId: string;
    status: PaymentStatus;
    raw: any;
  }) {
    const updatedPayment = await this.prisma.payment.upsert({
      where: { mpPaymentId: input.mpPaymentId },
      update: {
        status: input.status,
        rawResponse: input.raw ?? undefined,
        paidAt:
          input.status === PaymentStatus.APPROVED ? new Date() : undefined,
      },
      create: {
        feeId: input.feeId,
        mpPaymentId: input.mpPaymentId,
        status: input.status,
        rawResponse: input.raw ?? undefined,
        paidAt:
          input.status === PaymentStatus.APPROVED ? new Date() : undefined,
      },
    });

    if (input.status === PaymentStatus.APPROVED) {
      await this.prisma.monthlyFee.update({
        where: { id: input.feeId },
        data: { status: FeeStatus.PAID, paidAt: new Date() },
      });
    }

    return updatedPayment;
  }

  private mapMpStatus(status?: string): PaymentStatus {
    if (!status) return PaymentStatus.PENDING;
    if (status === 'approved') return PaymentStatus.APPROVED;
    if (status === 'rejected' || status === 'cancelled') {
      return PaymentStatus.REJECTED;
    }
    return PaymentStatus.PENDING;
  }
}
