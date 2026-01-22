import { IsEmail, IsEnum, IsOptional, IsString, Length } from 'class-validator';
import { UserRole } from '@prisma/client';

export class CreateAdminUserDto {
  @IsString()
  @Length(6, 12)
  dni: string;

  @IsString()
  @Length(8, 64)
  password: string;

  @IsEnum(UserRole)
  role: UserRole;

  @IsString()
  @Length(1, 60)
  firstName: string;

  @IsString()
  @Length(1, 60)
  lastName: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsOptional()
  @IsString()
  @Length(6, 30)
  phone?: string;
}
