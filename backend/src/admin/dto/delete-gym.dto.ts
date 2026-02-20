import { IsOptional, IsUUID } from 'class-validator';

export class DeleteGymDto {
  @IsOptional()
  @IsUUID()
  targetGymId?: string;
}
