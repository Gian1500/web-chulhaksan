import { Controller, Get, Param, Patch, Req, UseGuards, Body } from '@nestjs/common';
import { StudentsService } from './students.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { UpdateStudentDto } from './dto/update-student.dto';

@Controller('students')
@UseGuards(JwtAuthGuard, RolesGuard)
export class StudentsController {
  constructor(private readonly studentsService: StudentsService) {}

  @Get('me')
  @Roles(UserRole.STUDENT)
  getMe(@Req() req: Request) {
    return this.studentsService.getByDni(req['user'].dni);
  }

  @Get(':dni')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  getByDni(@Param('dni') dni: string) {
    return this.studentsService.getByDni(dni);
  }

  @Patch(':dni')
  @Roles(UserRole.TEACHER, UserRole.ADMIN)
  updateByDni(@Param('dni') dni: string, @Body() dto: UpdateStudentDto) {
    return this.studentsService.updateByDni(dni, dto);
  }
}
