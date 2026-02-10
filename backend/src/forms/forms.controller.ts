import { Body, Controller, Delete, Get, Param, Patch, Post, Req, UseGuards } from '@nestjs/common';
import { UserRole } from '@prisma/client';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { FormsService } from './forms.service';
import { CreateFormLinkDto } from './dto/create-form-link.dto';
import { UpdateFormLinkDto } from './dto/update-form-link.dto';
import { SetStudentFormAccessDto } from './dto/set-student-form-access.dto';

@Controller('forms')
@UseGuards(JwtAuthGuard, RolesGuard)
export class FormsController {
  constructor(private readonly formsService: FormsService) {}

  @Get()
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  listForms() {
    return this.formsService.listForms();
  }

  @Post()
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  createForm(@Body() dto: CreateFormLinkDto) {
    return this.formsService.createForm(dto);
  }

  @Patch(':id')
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  updateForm(@Param('id') id: string, @Body() dto: UpdateFormLinkDto) {
    return this.formsService.updateForm(id, dto);
  }

  @Delete(':id')
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  deleteForm(@Param('id') id: string) {
    return this.formsService.deleteForm(id);
  }

  @Get('me')
  @Roles(UserRole.STUDENT)
  listMyForms(@Req() req: Request) {
    return this.formsService.listMyForms(req['user'].dni);
  }

  @Get('student/:dni')
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  listFormsForStudent(@Req() req: Request, @Param('dni') dni: string) {
    return this.formsService.listFormsForStudent(req['user'], dni);
  }

  @Patch('student/:dni/access')
  @Roles(UserRole.ADMIN, UserRole.TEACHER)
  setStudentFormAccess(
    @Req() req: Request,
    @Param('dni') dni: string,
    @Body() dto: SetStudentFormAccessDto,
  ) {
    return this.formsService.setStudentFormAccess(req['user'], dni, dto);
  }
}

