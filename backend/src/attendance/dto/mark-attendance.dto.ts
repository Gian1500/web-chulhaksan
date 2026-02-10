import { IsBoolean, IsOptional, IsString, Length, Matches } from 'class-validator';

export class MarkAttendanceDto {
  @IsString()
  @Length(6, 12)
  studentDni: string;

  @IsString()
  @Matches(/^(\d{4}-\d{2}-\d{2}|\d{2}\/\d{2}\/\d{4})$/, {
    message: 'La fecha debe tener formato AAAA-MM-DD o DD/MM/AAAA.',
  })
  date: string;

  @IsBoolean()
  present: boolean;

  @IsOptional()
  @IsString()
  @Length(1, 200)
  notes?: string;
}
