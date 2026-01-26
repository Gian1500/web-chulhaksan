import { Injectable, Logger } from '@nestjs/common';
import { Cron } from '@nestjs/schedule';
import { FeesService } from './fees.service';

@Injectable()
export class FeesScheduler {
  private readonly logger = new Logger(FeesScheduler.name);

  constructor(private readonly feesService: FeesService) {}

  @Cron('0 5 1 * *')
  async generateMonthlyFees() {
    try {
      await this.feesService.generateMonthlyFees({});
    } catch (error) {
      const message = error instanceof Error ? error.message : 'Error desconocido';
      this.logger.warn(`No se pudieron generar cuotas: ${message}`);
    }
  }
}
