import {
  IsDateString,
  IsEmail,
  IsEnum,
  IsOptional,
  IsString,
  IsUUID,
  Length,
  Matches,
} from 'class-validator';
import { StudentCategory } from '@prisma/client';

export class CreateStudentDto {
  @IsString()
  @Length(6, 12)
  @Matches(/^\d+$/, { message: 'El DNI debe contener solo numeros.' })
  dni: string;

  @IsString()
  @Length(6, 64)
  password: string;

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

  @IsUUID()
  gymId: string;

  @IsEnum(StudentCategory, {
    message: 'Selecciona si el alumno es Adulto o Infantil.',
  })
  category: StudentCategory;

  @IsOptional()
  @IsDateString()
  birthDate?: string;

  @IsOptional()
  @IsString()
  @Length(3, 120)
  address?: string;
}
