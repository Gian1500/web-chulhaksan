import { IsDateString, IsEmail, IsEnum, IsOptional, IsString, IsUUID, Length } from 'class-validator';
import { StudentCategory } from '@prisma/client';

export class UpdateStudentDto {
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
  @IsUUID()
  gymId?: string;

  @IsOptional()
  @IsEnum(StudentCategory, {
    message: 'Selecciona si el alumno es Adulto o Infantil.',
  })
  category?: StudentCategory;

  @IsOptional()
  @IsDateString()
  birthDate?: string;

  @IsOptional()
  @IsString()
  @Length(3, 120)
  address?: string;
}
