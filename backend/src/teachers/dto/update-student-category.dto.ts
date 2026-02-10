import { IsEnum } from 'class-validator';
import { StudentCategory } from '@prisma/client';

export class UpdateStudentCategoryDto {
  @IsEnum(StudentCategory, { message: 'Tipo inválido.' })
  category: StudentCategory;
}

