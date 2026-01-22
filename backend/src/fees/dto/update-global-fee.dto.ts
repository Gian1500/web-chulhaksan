import { IsNumberString, IsOptional, IsString, Length } from 'class-validator';

export class UpdateGlobalFeeDto {
  @IsNumberString({ no_symbols: true })
  monthlyAmount: string;

  @IsOptional()
  @IsString()
  @Length(3, 6)
  currency?: string;
}
