import { Body, Controller, Get, Param, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { FeesService } from './fees.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { GenerateFeesDto } from './dto/generate-fees.dto';
import { UpdateGlobalFeeDto } from './dto/update-global-fee.dto';

@Controller('fees')
@UseGuards(JwtAuthGuard, RolesGuard)
export class FeesController {
  constructor(private readonly feesService: FeesService) {}

  @Get('me')
  @Roles(UserRole.STUDENT)
  listMyFees(@Req() req: Request) {
    return this.feesService.listMyFees(req['user'].dni);
  }

  @Get('student/:dni')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  listByStudent(@Param('dni') dni: string) {
    return this.feesService.listFeesByStudent(dni);
  }

  @Post('generate')
  @Roles(UserRole.ADMIN)
  generate(@Body() dto: GenerateFeesDto) {
    return this.feesService.generateMonthlyFees(dto);
  }

  @Patch(':id/mark-paid')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  markPaid(@Req() req: Request, @Param('id') id: string) {
    return this.feesService.markFeePaid(id, req['user'].role);
  }

  @Get('settings')
  @Roles(UserRole.ADMIN)
  getSettings() {
    return this.feesService.getGlobalFee();
  }

  @Patch('settings')
  @Roles(UserRole.ADMIN)
  updateSettings(@Body() dto: UpdateGlobalFeeDto) {
    return this.feesService.updateGlobalFee(dto);
  }
}
