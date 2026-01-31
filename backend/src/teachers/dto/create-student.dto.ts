import { IsDateString, IsEmail, IsString, Length, Matches } from 'class-validator';

export class CreateStudentDto {
  @IsString()
  @Length(6, 12)
  @Matches(/^\d+$/, { message: 'El DNI debe contener solo numeros.' })
  dni: string;

  @IsString()
  @Length(6, 64)
  password: string;

  @IsString()
  @Length(1, 60)
  firstName: string;

  @IsString()
  @Length(1, 60)
  lastName: string;

  @IsEmail()
  email: string;

  @IsString()
  @Length(6, 30)
  phone: string;

  @IsString()
  @Length(6, 30)
  guardianPhone: string;

  @IsString()
  @Length(2, 80)
  gym: string;

  @IsDateString()
  birthDate: string;

  @IsString()
  @Length(3, 120)
  address: string;
}
