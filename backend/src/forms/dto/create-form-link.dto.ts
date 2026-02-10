import { IsInt, IsOptional, IsString, IsUrl, MaxLength, Min } from 'class-validator';

export class CreateFormLinkDto {
  @IsString({ message: 'El título es obligatorio.' })
  @MaxLength(120, { message: 'El título es muy largo.' })
  title: string;

  @IsString({ message: 'La URL es obligatoria.' })
  @IsUrl({}, { message: 'La URL es inválida.' })
  url: string;

  @IsOptional()
  @IsInt({ message: 'El orden debe ser un número.' })
  @Min(0, { message: 'El orden no puede ser negativo.' })
  order?: number;
}
