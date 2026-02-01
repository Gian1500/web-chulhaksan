import { useEffect, useMemo, useState } from 'react';
import { Link, useSearchParams } from 'react-router-dom';
import { apiFetch } from './auth';

type PaymentDetails = {
  id: string;
  status: string;
  paidAt?: string | null;
  createdAt: string;
  mpPaymentId?: string | null;
  paymentMethod?: {
    id?: string | null;
    name?: string | null;
    type?: string | null;
    last4?: string | null;
  } | null;
  fee: {
    month: number;
    year: number;
    amount: string;
    student: {
      dni: string;
      firstName: string;
      lastName: string;
    } | null;
  };
};

const monthNames = [
  'Enero',
  'Febrero',
  'Marzo',
  'Abril',
  'Mayo',
  'Junio',
  'Julio',
  'Agosto',
  'Septiembre',
  'Octubre',
  'Noviembre',
  'Diciembre',
];

export function PaymentReceiptSuccess() {
  const [params] = useSearchParams();
  const externalRef = params.get('external_reference');
  const [payment, setPayment] = useState<PaymentDetails | null>(null);
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(true);
  const handlePrint = () => {
    window.print();
  };

  useEffect(() => {
    if (!externalRef) {
      setError('No se encontró el pago.');
      setLoading(false);
      return;
    }

    const loadPayment = async () => {
      try {
        const response = await apiFetch(`/payments/${externalRef}`, {
          method: 'GET',
        });
        if (!response.ok) {
          const body = await response.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudo cargar el comprobante.');
        }
        const data = (await response.json()) as PaymentDetails;
        setPayment(data);
      } catch (err) {
        const message =
          err instanceof Error
            ? err.message
            : 'No se pudo cargar el comprobante.';
        setError(message);
      } finally {
        setLoading(false);
      }
    };

    loadPayment();
  }, [externalRef]);

  const studentName = useMemo(() => {
    if (!payment?.fee.student) return 'Alumno';
    return `${payment.fee.student.firstName} ${payment.fee.student.lastName}`;
  }, [payment]);

  const monthLabel = useMemo(() => {
    if (!payment) return '';
    return `${monthNames[payment.fee.month - 1] ?? 'Mes'} ${payment.fee.year}`;
  }, [payment]);

  const dateLabel = useMemo(() => {
    if (!payment) return '-';
    const dateValue = payment.paidAt ?? payment.createdAt;
    if (!dateValue) return '-';
    return new Date(dateValue).toLocaleString('es-AR');
  }, [payment]);

  const methodLabel = useMemo(() => {
    if (!payment?.paymentMethod) return '-';
    if (payment.paymentMethod.type === 'account_money') {
      return 'Saldo en cuenta';
    }
    return payment.paymentMethod.name ?? payment.paymentMethod.id ?? '-';
  }, [payment]);

  const methodDetail = useMemo(() => {
    if (!payment?.paymentMethod?.last4) return '';
    return `•••• ${payment.paymentMethod.last4}`;
  }, [payment]);

  return (
    <div className="bg-background-light min-h-screen flex flex-col items-center">
      <div className="w-full max-w-[430px] sm:max-w-[560px] md:max-w-[720px] min-h-screen flex flex-col shadow-2xl bg-background-light overflow-hidden">
        <div className="flex items-center bg-background-light p-4 pb-2 justify-between sticky top-0 z-10 print:hidden">
          <Link
            className="text-background-dark flex size-12 shrink-0 items-center cursor-pointer"
            to="/pagos"
          >
            <span className="material-symbols-outlined text-2xl">
              arrow_back_ios
            </span>
          </Link>
          <h2 className="text-background-dark text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center">
            Comprobante de Pago
          </h2>
          <div className="size-12 shrink-0" aria-hidden="true"></div>
        </div>

        <div className="flex flex-col items-center pt-8 pb-4">
          <div className="bg-primary/20 p-6 rounded-full mb-4">
            <span className="material-symbols-outlined text-primary text-6xl font-bold">
              check_circle
            </span>
          </div>
          <h2 className="text-background-dark tracking-light text-[28px] font-bold leading-tight px-4 text-center">
            ¡Pago Exitoso!
          </h2>
          <p className="text-background-dark/70 text-base font-normal leading-normal px-4 text-center mt-2">
            Tu pago ha sido procesado correctamente
          </p>
        </div>

        <div className="px-6 py-4">
          <div className="bg-white rounded-xl shadow-sm border border-neutral-200 overflow-hidden relative">
            <div className="h-2 bg-primary w-full"></div>
            <div className="p-6">
              <div className="text-center mb-6 pb-6 border-b border-dashed border-neutral-200">
                <p className="text-neutral-500 text-xs uppercase tracking-widest font-semibold mb-1">
                  Monto Pagado
                </p>
                <h1 className="text-background-dark text-4xl font-bold">
                  {payment
                    ? `$${Number(payment.fee.amount).toLocaleString('es-AR')}`
                    : '--'}
                </h1>
              </div>
              {loading && (
                <p className="text-sm text-gray-500 text-center">
                  Cargando comprobante...
                </p>
              )}
              {error && (
                <p className="text-sm text-red-600 text-center">{error}</p>
              )}
              <div className="space-y-4">
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Estudiante
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    {studentName}
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">DNI</p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    {payment?.fee.student?.dni ?? '-'}
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Mes Pagado
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    {monthLabel || '-'}
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6 pt-2">
                  <p className="text-neutral-500 text-sm font-medium">
                    ID de Transacción
                  </p>
                  <p className="text-background-dark text-sm font-mono text-right">
                    {payment?.mpPaymentId ?? payment?.id ?? '-'}
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Fecha y Hora
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    {dateLabel}
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">Método</p>
                  <div className="flex items-center gap-2">
                    <span className="material-symbols-outlined text-base text-neutral-400">
                      credit_card
                    </span>
                    <p className="text-background-dark text-sm font-semibold text-right">
                      {methodLabel} {methodDetail}
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div className="absolute -bottom-1.5 left-0 right-0 flex justify-around px-2">
              {Array.from({ length: 8 }).map((_, index) => (
                <div
                  key={index}
                  className="h-3 w-3 rounded-full bg-background-light"
                ></div>
              ))}
            </div>
          </div>
        </div>

        <div className="px-6 py-8 flex flex-col gap-3">
          <button
            className="w-full bg-primary hover:bg-primary/90 text-background-dark font-bold py-4 rounded-xl flex items-center justify-center gap-2 transition-colors"
            type="button"
            onClick={handlePrint}
          >
            <span className="material-symbols-outlined">download</span>
            Descargar Comprobante (PDF)
          </button>
        </div>
        <div className="mt-auto h-8"></div>
      </div>
    </div>
  );
}
