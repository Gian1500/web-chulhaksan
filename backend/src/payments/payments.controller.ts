import { Body, Controller, Get, Param, Post, Query, Req, UseGuards } from '@nestjs/common';
import type { Request } from 'express';
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

  @Get(':id')
  @UseGuards(JwtAuthGuard, RolesGuard)
  @Roles(UserRole.STUDENT, UserRole.TEACHER, UserRole.ADMIN)
  getById(@Req() req: Request, @Param('id') id: string) {
    return this.paymentsService.getPaymentDetails(req['user'], id);
  }

  @Post('webhook')
  webhook(
    @Req() req: Request,
    @Body() body: any,
    @Query('teacherId') teacherId?: string,
  ) {
    return this.paymentsService.handleWebhookWithTeacher(body, teacherId, {
      headers: req.headers ?? {},
      query: req.query ?? {},
    });
  }
}
