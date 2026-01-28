import { Controller, Get, Query, Res } from '@nestjs/common';
import type { Response } from 'express';
import { TeachersService } from './teachers.service';

@Controller('teachers/mercadopago')
export class MercadoPagoController {
  constructor(private readonly teachersService: TeachersService) {}

  @Get('callback')
  async handleCallback(
    @Query('code') code: string | undefined,
    @Query('state') state: string | undefined,
    @Res() res: Response,
  ) {
    await this.teachersService.handleMpCallback(code ?? '', state ?? '');
    const baseUrl = process.env.MP_FRONTEND_URL ?? 'http://localhost:5173';
    const redirectUrl = `${baseUrl}/dashboard?mp=connected`;
    return res.redirect(redirectUrl);
  }
}
