import { IsString, Length } from 'class-validator';

export class CreateGymDto {
  @IsString()
  @Length(2, 80)
  name: string;
}

