import { IsOptional, IsString, Matches } from 'class-validator';

export class StudentAttendanceQueryDto {
  @IsOptional()
  @IsString()
  @Matches(/^(\d{4}-\d{2}-\d{2}|\d{2}\/\d{2}\/\d{4})$/, {
    message: 'El parametro "from" debe tener formato AAAA-MM-DD o DD/MM/AAAA.',
  })
  from?: string;

  @IsOptional()
  @IsString()
  @Matches(/^(\d{4}-\d{2}-\d{2}|\d{2}\/\d{2}\/\d{4})$/, {
    message: 'El parametro "to" debe tener formato AAAA-MM-DD o DD/MM/AAAA.',
  })
  to?: string;
}
