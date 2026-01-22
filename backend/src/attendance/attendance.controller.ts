import { Body, Controller, Get, Param, Post, UseGuards } from '@nestjs/common';
import { AttendanceService } from './attendance.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { MarkAttendanceDto } from './dto/mark-attendance.dto';

@Controller('attendance')
@UseGuards(JwtAuthGuard, RolesGuard)
export class AttendanceController {
  constructor(private readonly attendanceService: AttendanceService) {}

  @Post()
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  mark(@Body() dto: MarkAttendanceDto) {
    return this.attendanceService.markAttendance(dto);
  }

  @Get('student/:dni')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  listByStudent(@Param('dni') dni: string) {
    return this.attendanceService.listByStudent(dni);
  }
}
