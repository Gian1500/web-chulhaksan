import { Controller, Get, UseGuards } from '@nestjs/common';
import { UserRole } from '@prisma/client';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { GymsService } from './gyms.service';

@Controller('gyms')
@UseGuards(JwtAuthGuard, RolesGuard)
export class GymsController {
  constructor(private readonly gymsService: GymsService) {}

  // Used by admin/teacher UIs to populate selects and to navigate by gym.
  @Get()
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  list() {
    return this.gymsService.list();
  }
}

