import {
  IsArray,
  IsDateString,
  IsEmail,
  IsOptional,
  IsString,
  Length,
} from 'class-validator';

export class UpdateTeacherDto {
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
  @IsDateString()
  birthDate?: string;

  @IsOptional()
  @IsString()
  @Length(1, 120)
  address?: string;

  @IsOptional()
  @IsArray()
  @IsString({ each: true })
  gyms?: string[];
}
