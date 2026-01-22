import { Body, Controller, Get, Param, Post, Req, UseGuards } from '@nestjs/common';
import { AssignmentsService } from './assignments.service';
import { JwtAuthGuard } from '../auth/guards/jwt-auth.guard';
import { RolesGuard } from '../auth/guards/roles.guard';
import { Roles } from '../auth/roles.decorator';
import { UserRole } from '@prisma/client';
import { CreateRequestDto } from './dto/create-request.dto';

@Controller('assignments')
@UseGuards(JwtAuthGuard, RolesGuard)
export class AssignmentsController {
  constructor(private readonly assignmentsService: AssignmentsService) {}

  @Post('request')
  @Roles(UserRole.STUDENT, UserRole.TEACHER)
  createRequest(@Req() req: Request, @Body() dto: CreateRequestDto) {
    return this.assignmentsService.createRequest(req['user'], dto);
  }

  @Get('requests')
  @Roles(UserRole.STUDENT, UserRole.TEACHER)
  listMyPending(@Req() req: Request) {
    return this.assignmentsService.listMyPendingRequests(req['user']);
  }

  @Post(':id/approve')
  @Roles(UserRole.STUDENT, UserRole.TEACHER)
  approve(@Req() req: Request, @Param('id') id: string) {
    return this.assignmentsService.approveRequest(req['user'], id);
  }

  @Post(':id/reject')
  @Roles(UserRole.STUDENT, UserRole.TEACHER)
  reject(@Req() req: Request, @Param('id') id: string) {
    return this.assignmentsService.rejectRequest(req['user'], id);
  }
}
