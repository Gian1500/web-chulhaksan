import { IsBoolean, IsDateString, IsOptional, IsString, Length } from 'class-validator';

export class MarkAttendanceDto {
  @IsString()
  @Length(6, 12)
  studentDni: string;

  @IsDateString()
  date: string;

  @IsBoolean()
  present: boolean;

  @IsOptional()
  @IsString()
  @Length(1, 200)
  notes?: string;
}
