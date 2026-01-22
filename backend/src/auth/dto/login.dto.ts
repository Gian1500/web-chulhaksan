import { IsString, Length } from 'class-validator';

export class LoginDto {
  @IsString()
  @Length(6, 12)
  dni: string;

  @IsString()
  @Length(6, 64)
  password: string;
}
