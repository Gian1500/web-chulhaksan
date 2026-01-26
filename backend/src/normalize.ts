export function normalizeDni(value: string) {
  return value.replace(/\D/g, '');
}
