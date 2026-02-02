import {
  IsArray,
  IsDateString,
  IsEmail,
  IsEnum,
  IsOptional,
  IsString,
  Length,
  Matches,
} from 'class-validator';
import { UserRole } from '@prisma/client';

export class CreateAdminUserDto {
  @IsString()
  @Length(6, 12)
  @Matches(/^\d+$/, { message: 'El DNI debe contener solo numeros.' })
  dni: string;

  @IsString()
  @Length(6, 64)
  password: string;

  @IsEnum(UserRole)
  role: UserRole;

  @IsOptional()
  @IsString()
  @Length(1, 60)
  firstName?: string;

  @IsOptional()
  @IsString()
  @Length(1, 60)
  lastName?: string;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsOptional()
  @IsString()
  @Length(6, 30)
  phone?: string;

  @IsOptional()
  @IsString()
  @Length(6, 30)
  guardianPhone?: string;

  @IsOptional()
  @IsString()
  @Length(2, 80)
  gym?: string;

  @IsOptional()
  @IsDateString()
  birthDate?: string;

  @IsOptional()
  @IsString()
  @Length(3, 120)
  address?: string;

  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  gyms?: string[];
}
