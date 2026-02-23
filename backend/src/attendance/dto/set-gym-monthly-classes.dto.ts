import { IsInt, Max, Min } from 'class-validator';

export class SetGymMonthlyClassesDto {
  @IsInt()
  @Min(1)
  @Max(31)
  classesPlanned: number;
}

