import { IsBoolean, IsString, IsUUID } from 'class-validator';

export class SetStudentFormAccessDto {
  @IsString({ message: 'El formulario es obligatorio.' })
  @IsUUID('4', { message: 'El formulario es inválido.' })
  formId: string;

  @IsBoolean({ message: 'El estado es inválido.' })
  unlocked: boolean;
}

