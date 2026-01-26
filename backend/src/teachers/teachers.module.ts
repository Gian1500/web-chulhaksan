import { Module } from '@nestjs/common';
import { TeachersController } from './teachers.controller';
import { TeachersService } from './teachers.service';
import { AuthModule } from '../auth/auth.module';
import { MercadoPagoController } from './mercadopago.controller';

@Module({
  imports: [AuthModule],
  controllers: [TeachersController, MercadoPagoController],
  providers: [TeachersService],
})
export class TeachersModule {}
