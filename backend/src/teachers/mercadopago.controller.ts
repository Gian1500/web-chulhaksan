import { Controller, Get, Query } from '@nestjs/common';
import { TeachersService } from './teachers.service';

@Controller('teachers/mercadopago')
export class MercadoPagoController {
  constructor(private readonly teachersService: TeachersService) {}

  @Get('callback')
  handleCallback(@Query('code') code?: string, @Query('state') state?: string) {
    return this.teachersService.handleMpCallback(code ?? '', state ?? '');
  }
}
