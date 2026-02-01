import { Body, Controller, Delete, Get, Param, Patch, Post, Query, UseGuards } from '@nestjs/common';
import { AdminService } from './admin.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreateAdminUserDto } from './dto/create-admin-user.dto';
import { ListUsersDto } from './dto/list-users.dto';
import { UpdateUserStatusDto } from './dto/update-user-status.dto';
import { UpdateStudentDto } from '../students/dto/update-student.dto';
import { UpdateTeacherDto } from '../teachers/dto/update-teacher.dto';

@Controller('admin')
@UseGuards(JwtAuthGuard, RolesGuard)
@Roles(UserRole.ADMIN)
export class AdminController {
  constructor(private readonly adminService: AdminService) {}

  @Get('users')
  listUsers(@Query() query: ListUsersDto) {
    return this.adminService.listUsers(query);
  }

  @Post('users')
  createUser(@Body() dto: CreateAdminUserDto) {
    return this.adminService.createUser(dto);
  }

  @Patch('users/:id/status')
  updateStatus(@Param('id') id: string, @Body() dto: UpdateUserStatusDto) {
    return this.adminService.updateUserStatus(id, dto);
  }

  @Get('students')
  listStudents() {
    return this.adminService.listStudents();
  }

  @Delete('students/:dni')
  deleteStudent(@Param('dni') dni: string) {
    return this.adminService.deleteStudent(dni);
  }

  @Post('students/:dni/assign')
  assignStudent(
    @Param('dni') dni: string,
    @Body() body: { teacherId: string },
  ) {
    return this.adminService.assignStudentTeacher(dni, body.teacherId);
  }

  @Post('students/:dni/unassign')
  unassignStudent(@Param('dni') dni: string) {
    return this.adminService.unassignStudentTeacher(dni);
  }

  @Patch('students/:dni')
  updateStudent(@Param('dni') dni: string, @Body() dto: UpdateStudentDto) {
    return this.adminService.updateStudent(dni, dto);
  }

  @Get('teachers')
  listTeachers() {
    return this.adminService.listTeachers();
  }

  @Delete('teachers/:id')
  deleteTeacher(@Param('id') id: string) {
    return this.adminService.deleteTeacher(id);
  }

  @Patch('teachers/:id')
  updateTeacher(@Param('id') id: string, @Body() dto: UpdateTeacherDto) {
    return this.adminService.updateTeacher(id, dto);
  }
}
