import { Type } from 'class-transformer';
import { IsArray, IsBoolean, IsOptional, IsString, Length, ValidateNested } from 'class-validator';

export class SaveGymAttendanceItemDto {
  @IsString()
  @Length(6, 12)
  studentDni: string;

  @IsBoolean()
  present: boolean;

  @IsOptional()
  @IsString()
  @Length(1, 200)
  notes?: string;
}

export class SaveGymAttendanceDto {
  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => SaveGymAttendanceItemDto)
  items: SaveGymAttendanceItemDto[];
}

