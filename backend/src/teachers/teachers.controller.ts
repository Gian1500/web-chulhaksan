import { Body, Controller, Delete, Get, Param, Patch, Post, Query, Req, UseGuards } from '@nestjs/common';
import { TeachersService } from './teachers.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreateStudentDto } from './dto/create-student.dto';
import { PaginationDto } from '../common/dto/pagination.dto';
import { UpdateStudentGymDto } from './dto/update-student-gym.dto';
import { UpdateStudentCategoryDto } from './dto/update-student-category.dto';
import { UpdateStudentDto } from '../students/dto/update-student.dto';

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
  getMyStudents(@Req() req: Request, @Query() query: PaginationDto) {
    return this.teachersService.getMyStudents(req['user'].sub, query);
  }

  @Get('me/gyms')
  @Roles(UserRole.TEACHER)
  listMyGyms(@Req() req: Request) {
    return this.teachersService.listMyGyms(req['user'].sub);
  }

  @Get('me/available-students')
  @Roles(UserRole.TEACHER)
  listAvailableStudents(@Query() query: PaginationDto) {
    return this.teachersService.listAvailableStudents(query);
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

  @Patch('me/students/:dni/gym')
  @Roles(UserRole.TEACHER)
  updateStudentGym(
    @Req() req: Request,
    @Param('dni') dni: string,
    @Body() dto: UpdateStudentGymDto,
  ) {
    return this.teachersService.updateStudentGym(req['user'].sub, dni, dto);
  }

  @Patch('me/students/:dni/category')
  @Roles(UserRole.TEACHER)
  updateStudentCategory(
    @Req() req: Request,
    @Param('dni') dni: string,
    @Body() dto: UpdateStudentCategoryDto,
  ) {
    return this.teachersService.updateStudentCategory(req['user'].sub, dni, dto);
  }

  @Patch('me/students/:dni')
  @Roles(UserRole.TEACHER)
  updateStudent(
    @Req() req: Request,
    @Param('dni') dni: string,
    @Body() dto: UpdateStudentDto,
  ) {
    return this.teachersService.updateStudent(req['user'].sub, dni, dto);
  }

  @Delete('me/students/:dni')
  @Roles(UserRole.TEACHER)
  deleteStudent(@Req() req: Request, @Param('dni') dni: string) {
    return this.teachersService.deleteStudent(req['user'].sub, dni);
  }

  @Post('me/students/:dni/reset-password')
  @Roles(UserRole.TEACHER)
  resetStudentPassword(@Req() req: Request, @Param('dni') dni: string) {
    return this.teachersService.resetStudentPassword(req['user'].sub, dni);
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
