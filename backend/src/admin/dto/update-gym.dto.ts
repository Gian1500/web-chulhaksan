import { IsString, Length } from 'class-validator';

export class UpdateGymDto {
  @IsString()
  @Length(2, 80)
  name: string;
}

