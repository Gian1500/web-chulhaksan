import { IsEnum, IsOptional, IsString, Length } from 'class-validator';
import { UserRole, UserStatus } from '@prisma/client';

export class ListUsersDto {
  @IsOptional()
  @IsEnum(UserRole)
  role?: UserRole;

  @IsOptional()
  @IsEnum(UserStatus)
  status?: UserStatus;

  @IsOptional()
  @IsString()
  @Length(1, 60)
  search?: string;
}
