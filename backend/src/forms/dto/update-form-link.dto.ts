import { IsInt, IsOptional, IsString, IsUrl, MaxLength, Min } from 'class-validator';

export class UpdateFormLinkDto {
  @IsOptional()
  @IsString({ message: 'El título es inválido.' })
  @MaxLength(120, { message: 'El título es muy largo.' })
  title?: string;

  @IsOptional()
  @IsString({ message: 'La URL es inválida.' })
  @IsUrl({}, { message: 'La URL es inválida.' })
  url?: string;

  @IsOptional()
  @IsInt({ message: 'El orden debe ser un número.' })
  @Min(0, { message: 'El orden no puede ser negativo.' })
  order?: number;
}

