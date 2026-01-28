import { Module } from '@nestjs/common';
import { FeesController } from './fees.controller';
import { FeesService } from './fees.service';
import { AuthModule } from '../auth/auth.module';
import { FeesScheduler } from './fees.scheduler';

@Module({
  imports: [AuthModule],
  controllers: [FeesController],
  providers: [FeesService, FeesScheduler],
})
export class FeesModule {}
