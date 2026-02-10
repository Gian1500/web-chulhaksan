import { Body, Controller, Get, Param, Post, Put, Query, Req, UseGuards } from '@nestjs/common';
import { AttendanceService } from './attendance.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { MarkAttendanceDto } from './dto/mark-attendance.dto';
import { AttendanceDateQueryDto } from './dto/attendance-date-query.dto';
import { SaveGymAttendanceDto } from './dto/save-gym-attendance.dto';
import { StudentAttendanceQueryDto } from './dto/student-attendance-query.dto';

@Controller('attendance')
@UseGuards(JwtAuthGuard, RolesGuard)
export class AttendanceController {
  constructor(private readonly attendanceService: AttendanceService) {}

  @Post()
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  mark(@Req() req: Request, @Body() dto: MarkAttendanceDto) {
    return this.attendanceService.markAttendance(
      { userId: req['user'].sub, role: req['user'].role },
      dto,
    );
  }

  @Get('student/:dni')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  listByStudent(@Req() req: Request, @Param('dni') dni: string) {
    return this.attendanceService.listByStudent(
      { userId: req['user'].sub, role: req['user'].role },
      dni,
    );
  }

  @Get('me')
  @Roles(UserRole.STUDENT)
  listMe(@Req() req: Request, @Query() query: StudentAttendanceQueryDto) {
    return this.attendanceService.listForStudentMe(req['user'].dni, query);
  }

  @Get('gym/:gymId')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  listByGym(
    @Req() req: Request,
    @Param('gymId') gymId: string,
    @Query() query: AttendanceDateQueryDto,
  ) {
    return this.attendanceService.listByGym(
      { userId: req['user'].sub, role: req['user'].role },
      gymId,
      query.date,
    );
  }

  @Put('gym/:gymId')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  saveByGym(
    @Req() req: Request,
    @Param('gymId') gymId: string,
    @Query() query: AttendanceDateQueryDto,
    @Body() dto: SaveGymAttendanceDto,
  ) {
    return this.attendanceService.saveForGym(
      { userId: req['user'].sub, role: req['user'].role },
      gymId,
      query.date,
      dto,
    );
  }
}
