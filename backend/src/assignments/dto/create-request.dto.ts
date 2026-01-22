import { IsString, Length } from 'class-validator';

export class CreateRequestDto {
  @IsString()
  @Length(6, 12)
  studentDni: string;

  @IsString()
  teacherId: string;
}
