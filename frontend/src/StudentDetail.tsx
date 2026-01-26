import { useEffect, useMemo, useState } from 'react';
import { Link, useParams } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type StudentDetailData = {
  dni: string;
  firstName: string;
  lastName: string;
  phone?: string | null;
  guardianPhone?: string | null;
  email?: string | null;
  birthDate?: string | null;
  address?: string | null;
  gym?: string | null;
};

type FeeItem = {
  id: string;
  month: number;
  year: number;
  amount: number | string;
  status: 'PENDING' | 'PAID';
  dueDate: string;
  paidAt?: string | null;
  lateFeeApplied?: boolean;
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

export function StudentDetail() {
  const { dni } = useParams();
  const [student, setStudent] = useState<StudentDetailData | null>(null);
  const [fees, setFees] = useState<FeeItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [marking, setMarking] = useState<string | null>(null);

  useEffect(() => {
    const token = getToken();
    if (!token || !dni) {
      setError('Inicia sesion para ver el alumno.');
      setLoading(false);
      return;
    }

    const load = async () => {
      try {
        const [studentResponse, feesResponse] = await Promise.all([
          fetch(`${apiBaseUrl}/students/${dni}`, {
            headers: getApiHeaders({ token }),
          }),
          fetch(`${apiBaseUrl}/fees/student/${dni}`, {
            headers: getApiHeaders({ token }),
          }),
        ]);

        if (!studentResponse.ok) {
          const body = await studentResponse.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudo cargar el alumno.');
        }
        if (!feesResponse.ok) {
          const body = await feesResponse.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudo cargar las cuotas.');
        }

        const studentData = (await studentResponse.json()) as StudentDetailData;
        const feesData = (await feesResponse.json()) as FeeItem[];
        setStudent(studentData);
        setFees(feesData ?? []);
      } catch (err) {
        const message =
          err instanceof Error ? err.message : 'No se pudo cargar el alumno.';
        setError(message);
      } finally {
        setLoading(false);
      }
    };

    load();
  }, [dni]);

  const fullName = useMemo(() => {
    if (!student) return 'Alumno';
    return `${student.firstName} ${student.lastName}`;
  }, [student]);

  const birthDateLabel = useMemo(() => {
    if (!student?.birthDate) return '-';
    return new Date(student.birthDate).toLocaleDateString('es-AR');
  }, [student]);

  const handleMarkPaid = async (feeId: string) => {
    const token = getToken();
    if (!token) return;
    setMarking(feeId);
    setError('');
    try {
      const response = await fetch(`${apiBaseUrl}/fees/${feeId}/mark-paid`, {
        method: 'PATCH',
        headers: getApiHeaders({ token }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo marcar el pago.');
      }
      const updatedFees = fees.map((fee) =>
        fee.id === feeId
          ? { ...fee, status: 'PAID', paidAt: new Date().toISOString() }
          : fee,
      );
      setFees(updatedFees);
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo marcar el pago.';
      setError(message);
    } finally {
      setMarking(null);
    }
  };

  return (
    <div className="relative flex h-auto min-h-screen w-full flex-col max-w-[480px] mx-auto overflow-x-hidden border-x border-gray-200 bg-background-light text-[#1b0d0d]">
      <div className="sticky top-0 z-10 flex items-center bg-background-light/90 backdrop-blur-md p-4 pb-2 justify-between border-b border-gray-100">
        <Link
          className="text-[#1b0d0d] flex size-12 shrink-0 items-center cursor-pointer"
          to="/profesor/alumnos"
        >
          <span className="material-symbols-outlined">arrow_back_ios</span>
        </Link>
        <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center">
          Detalle del Alumno
        </h2>
        <div className="flex w-12 items-center justify-end">
          <span className="material-symbols-outlined">badge</span>
        </div>
      </div>

      <div className="flex p-4 @container">
        <div className="flex w-full flex-col gap-4 items-center">
          <div className="flex gap-4 flex-col items-center">
            <div className="bg-primary/10 text-primary flex items-center justify-center rounded-full h-28 w-28">
              <span className="material-symbols-outlined text-4xl">person</span>
            </div>
            <div className="flex flex-col items-center justify-center">
              <p className="text-[#1b0d0d] text-[24px] font-bold leading-tight tracking-[-0.015em] text-center">
                {fullName}
              </p>
              <p className="text-[#9a4c4c] text-sm font-medium mt-1 leading-normal text-center">
                {student?.gym ? `Gimnasio: ${student.gym}` : 'Gimnasio sin definir'}
              </p>
            </div>
          </div>
        </div>
      </div>

      {loading && (
        <div className="px-4 pb-4 text-sm text-gray-500">
          Cargando alumno...
        </div>
      )}
      {error && (
        <div className="px-4 pb-4 text-sm text-red-600">{error}</div>
      )}

      <h3 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-2">
        Informacion Personal
      </h3>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">fingerprint</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            DNI
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            {student?.dni ?? '-'}
          </p>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">phone</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Telefono
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            {student?.phone ?? '-'}
          </p>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">support_agent</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Tutor
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            {student?.guardianPhone ?? '-'}
          </p>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">mail</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Email
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            {student?.email ?? '-'}
          </p>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">cake</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Fecha de Nacimiento
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            {birthDateLabel}
          </p>
        </div>
      </div>

      <h3 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-6">
        Estado de Pagos
      </h3>

      <div className="px-4 pb-24 space-y-3">
        {fees.length === 0 && !loading && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            No hay cuotas registradas.
          </div>
        )}
        {fees.map((fee) => {
          const monthLabel = monthNames[fee.month - 1] ?? `Mes ${fee.month}`;
          const isPaid = fee.status === 'PAID';
          const amountLabel = Number(fee.amount).toLocaleString('es-AR');
          return (
            <div
              key={fee.id}
              className="bg-white border border-gray-100 rounded-xl p-4 shadow-sm space-y-3"
            >
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-sm font-semibold">
                    {monthLabel} {fee.year}
                  </p>
                  <p className="text-xs text-gray-500">
                    Vence: {new Date(fee.dueDate).toLocaleDateString('es-AR')}
                  </p>
                </div>
                <span
                  className={`px-2 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider ${
                    isPaid ? 'bg-green-100 text-green-700' : 'bg-primary/10 text-primary'
                  }`}
                >
                  {isPaid ? 'Pagado' : 'Pendiente'}
                </span>
              </div>
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-xs text-gray-500">Monto</p>
                  <p className="text-base font-bold">${amountLabel}</p>
                  {fee.lateFeeApplied && !isPaid && (
                    <p className="text-[11px] text-primary mt-1">
                      Incluye recargo por mora.
                    </p>
                  )}
                </div>
                {!isPaid && (
                  <button
                    className="rounded-lg bg-primary text-white text-xs font-semibold px-3 py-2 disabled:opacity-70"
                    type="button"
                    onClick={() => handleMarkPaid(fee.id)}
                    disabled={marking === fee.id}
                  >
                    {marking === fee.id ? 'Marcando...' : 'Marcar efectivo'}
                  </button>
                )}
                {isPaid && fee.paidAt && (
                  <span className="text-xs text-gray-500">
                    {new Date(fee.paidAt).toLocaleDateString('es-AR')}
                  </span>
                )}
              </div>
            </div>
          );
        })}
      </div>
    </div>
  );
}
