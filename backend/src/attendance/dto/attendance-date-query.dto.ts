import { IsString, Matches } from 'class-validator';

export class AttendanceDateQueryDto {
  @IsString()
  @Matches(/^(\d{4}-\d{2}-\d{2}|\d{2}\/\d{2}\/\d{4})$/, {
    message: 'La fecha debe tener formato AAAA-MM-DD o DD/MM/AAAA.',
  })
  date: string;
}
