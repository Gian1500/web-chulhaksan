import { Body, Controller, Get, Param, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { TeachersService } from './teachers.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreateStudentDto } from './dto/create-student.dto';

@Controller('teachers')
@UseGuards(JwtAuthGuard, RolesGuard)
export class TeachersController {
  constructor(private readonly teachersService: TeachersService) {}

  @Get('me')
  @Roles(UserRole.TEACHER)
  getMe(@Req() req: Request) {
    return this.teachersService.getByUserId(req['user'].sub);
  }

  @Get('me/students')
  @Roles(UserRole.TEACHER)
  getMyStudents(@Req() req: Request) {
    return this.teachersService.getMyStudents(req['user'].sub);
  }

  @Get('me/available-students')
  @Roles(UserRole.TEACHER)
  listAvailableStudents() {
    return this.teachersService.listAvailableStudents();
  }

  @Post('me/students')
  @Roles(UserRole.TEACHER)
  createStudent(@Req() req: Request, @Body() dto: CreateStudentDto) {
    return this.teachersService.createStudent(req['user'].sub, dto);
  }

  @Post('me/students/:dni/assign')
  @Roles(UserRole.TEACHER)
  assignStudent(@Req() req: Request, @Param('dni') dni: string) {
    return this.teachersService.assignStudent(req['user'].sub, dni);
  }

  @Post('me/students/:dni/unassign')
  @Roles(UserRole.TEACHER)
  unassignStudent(@Req() req: Request, @Param('dni') dni: string) {
    return this.teachersService.unassignStudent(req['user'].sub, dni);
  }

  @Get(':id')
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  getById(@Param('id') id: string) {
    return this.teachersService.getById(id);
  }

  @Get('me/mercadopago/connect')
  @Roles(UserRole.TEACHER)
  getMpConnectUrl(@Req() req: Request) {
    return this.teachersService.getMpConnectUrl(req['user'].sub);
  }

  @Post('me/mercadopago/disconnect')
  @Roles(UserRole.TEACHER)
  disconnectMp(@Req() req: Request) {
    return this.teachersService.disconnectMp(req['user'].sub);
  }
}
