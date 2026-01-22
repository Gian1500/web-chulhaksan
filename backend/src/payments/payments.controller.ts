import { Body, Controller, Get, Param, Post, Req, UseGuards } from '@nestjs/common';
import { PaymentsService } from './payments.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreatePaymentDto } from './dto/create-payment.dto';

@Controller('payments')
export class PaymentsController {
  constructor(private readonly paymentsService: PaymentsService) {}

  @Post('create')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(UserRole.STUDENT, UserRole.TEACHER, UserRole.ADMIN)
  create(@Req() req: Request, @Body() dto: CreatePaymentDto) {
    return this.paymentsService.createPayment(req['user'], dto);
  }

  @Get(':feeId/qr')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(UserRole.STUDENT, UserRole.TEACHER, UserRole.ADMIN)
  createQr(@Req() req: Request, @Param('feeId') feeId: string) {
    return this.paymentsService.createQrForFee(req['user'], feeId);
  }

  @Post('webhook')
  webhook(@Body() body: any) {
    return this.paymentsService.handleWebhook(body);
  }
}
