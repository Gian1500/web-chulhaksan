import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type FeeItem = {
  id: string;
  month: number;
  year: number;
  amount: string;
  status: 'PENDING' | 'PAID';
  dueDate: string;
  paidAt?: string | null;
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

export function Payments() {
  const [fees, setFees] = useState<FeeItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const pendingCount = useMemo(
    () => fees.filter((fee) => fee.status === 'PENDING').length,
    [fees],
  );

  useEffect(() => {
    const token = getToken();
    if (!token) {
      setError('Iniciá sesión para ver tus cuotas.');
      setLoading(false);
      return;
    }

    const loadFees = async () => {
      try {
        const response = await fetch(`${apiBaseUrl}/fees/me`, {
          headers: getApiHeaders({ token }),
        });
        if (!response.ok) {
          const body = await response.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudieron cargar las cuotas.');
        }
        const data = (await response.json()) as FeeItem[];
        setFees(data ?? []);
      } catch (err) {
        const message =
          err instanceof Error
            ? err.message
            : 'No se pudieron cargar las cuotas.';
        setError(message);
      } finally {
        setLoading(false);
      }
    };

    loadFees();
  }, []);

  const handlePay = async (feeId: string) => {
    const token = getToken();
    if (!token) {
      setError('Iniciá sesión para continuar.');
      return;
    }
    setError('');
    try {
      const response = await fetch(`${apiBaseUrl}/payments/create`, {
        method: 'POST',
        headers: getApiHeaders({ token, json: true }),
        body: JSON.stringify({ feeId }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo iniciar el pago.');
      }
      const data = (await response.json()) as { initPoint?: string };
      if (data?.initPoint) {
        window.location.href = data.initPoint;
      } else {
        throw new Error('No se recibió el link de pago.');
      }
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo iniciar el pago.';
      setError(message);
    }
  };

  return (
    <div className="min-h-screen bg-background-light text-[#1b0d0d]">
      <header className="sticky top-0 z-50 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center rounded-full hover:bg-gray-100 transition-colors"
            to="/dashboard"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h1 className="text-lg font-bold leading-tight tracking-tight flex-1 text-center pr-10">
            Mis Pagos y Cuotas
          </h1>
        </div>
      </header>

      <main className="max-w-md mx-auto pb-24">
        <section className="p-4">
          <div className="bg-white rounded-xl p-5 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] flex items-center gap-4">
            <div className="relative">
              <div
                className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-20 w-20 border-2 border-primary"
                style={{
                  backgroundImage:
                    'url("https://lh3.googleusercontent.com/aida-public/AB6AXuAos5xQbdG0hopRVsTPpirAP0KbSkbwXsF01UGAMj1noMqHm6Vc45_Nq1nXZoQluBpRJRM_3x6J5l3qIiIjj4Kz3hzlnnggc9D3YIpjUGVE82iENCBnwKb_uutYZCpfaEnXcfE-HETPtNWEVy14tzaeDMlXVUtRSyIrkNZMZ6bQegcqEfUuRuhZ_WiJ4u3O6SFgkXkWoAPvIc9jlG0Gm0GkYpSVx-oIviQtjbdgYUF2JMkK9WdFcyjg7hr7ZKMnXz22eTiTHhatuixZ")',
                }}
              />
              <div className="absolute -bottom-1 -right-1 bg-primary text-white text-[10px] px-2 py-0.5 rounded-full font-bold uppercase">
                1er Dan
              </div>
            </div>
            <div className="flex flex-col justify-center">
              <p className="text-xl font-bold leading-tight">Juan Pérez</p>
              <p className="text-gray-600 text-sm font-medium">
                Cinturón Negro
              </p>
              <div className="mt-2 flex items-center gap-1.5">
                <span className="size-2 rounded-full bg-orange-500 animate-pulse" />
                <p className="text-orange-600 text-xs font-semibold">
                  {pendingCount} Cuota{pendingCount === 1 ? '' : 's'} Pendiente
                </p>
              </div>
            </div>
          </div>
        </section>

        <div className="px-4 flex justify-between items-end">
          <h3 className="text-lg font-bold leading-tight">Cuotas</h3>
          <span className="text-xs text-gray-500 font-medium">
            Ciclo Actual
          </span>
        </div>

        <div className="mt-4 px-4 space-y-4">
          {loading && (
            <div className="bg-white rounded-xl p-4 border border-gray-100 text-sm text-gray-600">
              Cargando cuotas...
            </div>
          )}
          {error && (
            <div className="bg-red-50 rounded-xl p-4 border border-red-200 text-sm text-red-600">
              {error}
            </div>
          )}
          {!loading && !error && fees.length === 0 && (
            <div className="bg-white rounded-xl p-4 border border-gray-100 text-sm text-gray-600">
              No hay cuotas registradas.
            </div>
          )}
          {fees.map((fee) => {
            const monthLabel = monthNames[fee.month - 1] ?? `Mes ${fee.month}`;
            const paid = fee.status === 'PAID';
            const paidLabel = fee.paidAt
              ? new Date(fee.paidAt).toLocaleDateString('es-AR')
              : 'Sin fecha';
            const dueLabel = fee.dueDate
              ? new Date(fee.dueDate).toLocaleDateString('es-AR')
              : '-';

            return (
              <div
                key={fee.id}
                className={`bg-white rounded-xl p-4 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] border-l-4 ${
                  paid ? 'border-green-500' : 'border-primary'
                }`}
              >
                <div className="flex items-center justify-between mb-2">
                  <div className="flex items-center gap-3">
                    <div
                      className={`${
                        paid
                          ? 'text-green-600 bg-green-100'
                          : 'text-primary bg-primary/10'
                      } flex items-center justify-center rounded-lg shrink-0 size-10`}
                    >
                      <span className="material-symbols-outlined">
                        {paid ? 'check_circle' : 'schedule'}
                      </span>
                    </div>
                    <div>
                      <p className="text-base font-semibold">
                        {monthLabel} {fee.year}
                      </p>
                      <p className="text-xs text-gray-500">
                        {paid ? `Pagado el ${paidLabel}` : `Vence el ${dueLabel}`}
                      </p>
                    </div>
                  </div>
                  <div className="text-right">
                    <p className="text-base font-bold">
                      ${Number(fee.amount).toLocaleString('es-AR')}
                    </p>
                    <span
                      className={`text-[10px] uppercase font-bold tracking-wider ${
                        paid ? 'text-green-600' : 'text-primary'
                      }`}
                    >
                      {paid ? 'Acreditado' : 'Pendiente'}
                    </span>
                  </div>
                </div>
                {!paid && (
                  <div className="flex flex-col gap-2 pt-2 border-t border-gray-100">
                    <button
                      className="w-full bg-primary text-white py-2.5 rounded-lg font-semibold text-sm flex items-center justify-center gap-2 active:scale-[0.98] transition-transform"
                      type="button"
                      onClick={() => handlePay(fee.id)}
                    >
                      <span className="material-symbols-outlined text-lg">
                        payments
                      </span>
                      Pagar con Mercado Pago
                    </button>
                    <Link
                      className="w-full bg-white border border-primary text-primary py-2.5 rounded-lg font-semibold text-sm flex items-center justify-center gap-2 active:scale-[0.98] transition-transform"
                      to={`/pagos/qr?feeId=${fee.id}`}
                    >
                      <span className="material-symbols-outlined text-lg">
                        qr_code_2
                      </span>
                      Generar Código QR
                    </Link>
                  </div>
                )}
              </div>
            );
          })}
        </div>

        <section className="mt-8 px-4">
          <div className="bg-primary/5 border border-primary/20 rounded-xl p-4">
            <div className="flex gap-3">
              <span className="material-symbols-outlined text-primary">info</span>
              <div>
                <p className="text-sm font-bold text-primary">
                  Información de Cobro
                </p>
                <p className="text-xs text-gray-600 mt-1 leading-relaxed">
                  Las cuotas vencen el día 10 de cada mes. A partir del día 15
                  se aplica un recargo del 10% por mora administrativa.
                </p>
              </div>
            </div>
          </div>
        </section>
      </main>

      <nav className="fixed bottom-0 left-0 right-0 bg-white/90 backdrop-blur-lg border-t border-gray-200 pb-6 pt-2">
        <div className="max-w-md mx-auto flex justify-around items-center">
          <Link className="flex flex-col items-center gap-1 text-gray-400" to="/">
            <span className="material-symbols-outlined">home</span>
            <span className="text-[10px] font-medium">Inicio</span>
          </Link>
          <button className="flex flex-col items-center gap-1 text-primary" type="button">
            <span
              className="material-symbols-outlined"
              style={{ fontVariationSettings: '"FILL" 1' }}
            >
              account_balance_wallet
            </span>
            <span className="text-[10px] font-bold">Pagos</span>
          </button>
          <Link
            className="flex flex-col items-center gap-1 text-gray-400"
            to="/pagos/qr"
          >
            <span className="material-symbols-outlined">qr_code_2</span>
            <span className="text-[10px] font-medium">QR</span>
          </Link>
          <Link
            className="flex flex-col items-center gap-1 text-gray-400"
            to="/perfil"
          >
            <span className="material-symbols-outlined">person</span>
            <span className="text-[10px] font-medium">Perfil</span>
          </Link>
        </div>
      </nav>
    </div>
  );
}
