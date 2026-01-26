import { IsString, Length, Matches } from 'class-validator';

export class LoginDto {
  @IsString()
  @Length(6, 12)
  @Matches(/^\d+$/, { message: 'El DNI debe contener solo numeros.' })
  dni: string;

  @IsString()
  @Length(6, 64)
  password: string;
}
