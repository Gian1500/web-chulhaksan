import { IsUUID } from 'class-validator';

export class UpdateStudentGymDto {
  @IsUUID()
  gymId: string;
}

