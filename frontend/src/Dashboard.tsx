import { useEffect, useMemo, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import type { AuthProfile, UserRole } from './auth';
import { apiBaseUrl, clearAuth, getApiHeaders, getProfile, getToken } from './auth';

const roleLabels: Record<UserRole, string> = {
  STUDENT: 'Alumno',
  TEACHER: 'Profesor',
  ADMIN: 'Admin',
};

type StudentSummary = {
  dni: string;
  firstName: string;
  lastName: string;
};

export function Dashboard() {
  const navigate = useNavigate();
  const [profile, setProfile] = useState<AuthProfile | null>(getProfile());
  const [displayName, setDisplayName] = useState('');
  const [studentSummary, setStudentSummary] = useState<StudentSummary | null>(
    null,
  );
  const role = profile?.role ?? 'STUDENT';
  const [feeMessage, setFeeMessage] = useState('');
  const [feeLoading, setFeeLoading] = useState(false);
  const [feeAmount, setFeeAmount] = useState('7500');
  const [feeCurrency, setFeeCurrency] = useState('ARS');

  const title = useMemo(() => {
    if (role === 'TEACHER') return 'Panel del Profesor';
    if (role === 'ADMIN') return 'Panel de Administración';
    return 'Panel del Alumno';
  }, [role]);

  const handleLogout = () => {
    clearAuth();
    setProfile(null);
    navigate('/login');
  };

  useEffect(() => {
    if (!profile) {
      setDisplayName('');
      setStudentSummary(null);
      return;
    }

    const token = getToken();
    if (!token) {
      setDisplayName('');
      setStudentSummary(null);
      return;
    }

    const loadName = async () => {
      try {
        if (profile.role === 'STUDENT') {
          const response = await fetch(`${apiBaseUrl}/students/me`, {
            headers: getApiHeaders({ token }),
          });
          if (response.ok) {
            const data = await response.json();
            setDisplayName(`${data.firstName ?? ''} ${data.lastName ?? ''}`.trim());
            setStudentSummary({
              dni: data.dni ?? '',
              firstName: data.firstName ?? '',
              lastName: data.lastName ?? '',
            });
            return;
          }
        }

        if (profile.role === 'TEACHER') {
          const response = await fetch(`${apiBaseUrl}/teachers/me`, {
            headers: getApiHeaders({ token }),
          });
          if (response.ok) {
            const data = await response.json();
            setDisplayName(`${data.firstName ?? ''} ${data.lastName ?? ''}`.trim());
            return;
          }
        }

        if (profile.role === 'ADMIN') {
          setDisplayName('Administrador');
        }
      } catch {
        setDisplayName('');
        setStudentSummary(null);
      }
    };

    loadName();
  }, [profile]);

  const handleGenerateFees = async () => {
    const token = getToken();
    if (!token) {
      setFeeMessage('Iniciá sesión como admin para generar cuotas.');
      return;
    }
    setFeeMessage('');
    setFeeLoading(true);
    try {
      const now = new Date();
      const response = await fetch(`${apiBaseUrl}/fees/generate`, {
        method: 'POST',
        headers: getApiHeaders({ token, json: true }),
        body: JSON.stringify({
          month: now.getMonth() + 1,
          year: now.getFullYear(),
        }),
      });

      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudieron generar las cuotas.');
      }
      const data = await response.json();
      setFeeMessage(`Cuotas generadas: ${data?.created ?? 0}`);
    } catch (err) {
      const message =
        err instanceof Error
          ? err.message
          : 'No se pudieron generar las cuotas.';
      setFeeMessage(message);
    } finally {
      setFeeLoading(false);
    }
  };

  const handleSaveGlobalFee = async () => {
    const token = getToken();
    if (!token) {
      setFeeMessage('Iniciá sesión como admin para configurar la cuota.');
      return;
    }
    setFeeMessage('');
    setFeeLoading(true);
    try {
      const response = await fetch(`${apiBaseUrl}/fees/settings`, {
        method: 'PATCH',
        headers: getApiHeaders({ token, json: true }),
        body: JSON.stringify({
          monthlyAmount: feeAmount,
          currency: feeCurrency,
        }),
      });

      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo guardar la cuota global.');
      }
      setFeeMessage('Cuota global actualizada.');
    } catch (err) {
      const message =
        err instanceof Error
          ? err.message
          : 'No se pudo guardar la cuota global.';
      setFeeMessage(message);
    } finally {
      setFeeLoading(false);
    }
  };

  return (
    <div className="min-h-screen bg-background-light text-[#1b0d0d]">
      <header className="sticky top-0 z-20 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center"
            to="/login"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-tight flex-1 text-center">
            {title}
          </h2>
          <div className="flex w-10 items-center justify-end">
            <button
              className="flex size-10 items-center justify-center"
              type="button"
              onClick={handleLogout}
              aria-label="Cerrar sesión"
            >
              <span className="material-symbols-outlined">logout</span>
            </button>
          </div>
        </div>
      </header>

      <main className="max-w-md mx-auto p-4 pb-20 space-y-6">
        <section className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
          <p className="text-xs uppercase tracking-[0.2em] text-primary font-bold">
            Perfil activo
          </p>
          <div className="mt-4 flex items-center gap-4">
            <div className="h-14 w-14 rounded-full bg-primary/10 flex items-center justify-center text-primary">
              <span className="material-symbols-outlined">person</span>
            </div>
            <div className="flex-1">
              <p className="text-sm font-semibold">
                {profile ? roleLabels[role] : 'Invitado'}
              </p>
              <p className="text-lg font-bold leading-tight">
                {displayName || (profile ? 'Perfil sin nombre' : 'Inicia sesión')}
              </p>
              <p className="text-xs text-gray-500">
                DNI: {profile?.dni ?? 'Sin sesión'}
              </p>
            </div>
            {!profile && (
              <Link className="text-sm font-semibold text-primary" to="/login">
                Iniciar sesión
              </Link>
            )}
          </div>
        </section>

        {role === 'STUDENT' && (
          <section className="space-y-4">
            <div className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
              <p className="text-xs uppercase tracking-[0.2em] text-primary font-bold">
                Profesor actual
              </p>
              <div className="mt-3 flex items-center gap-3">
                <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                  <span className="material-symbols-outlined">sports_martial_arts</span>
                </div>
                <div>
                  <p className="text-sm font-semibold">Prof. Ana Martínez</p>
                  <p className="text-xs text-gray-500">Asignado desde 2022</p>
                </div>
              </div>
            </div>

            <div className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
              <p className="text-sm font-bold">Acceso rápido</p>
              <div className="mt-4 grid grid-cols-2 gap-3">
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/pagos"
                >
                  <span className="material-symbols-outlined text-primary">payments</span>
                  <span className="text-sm font-semibold">Pagos</span>
                  <span className="text-xs text-gray-500">Cuotas y estado</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/perfil"
                >
                  <span className="material-symbols-outlined text-primary">person</span>
                  <span className="text-sm font-semibold">Perfil</span>
                  <span className="text-xs text-gray-500">Datos personales</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/pagos"
                >
                  <span className="material-symbols-outlined text-primary">receipt_long</span>
                  <span className="text-sm font-semibold">Historial</span>
                  <span className="text-xs text-gray-500">Comprobantes</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/perfil"
                >
                  <span className="material-symbols-outlined text-primary">sports_martial_arts</span>
                  <span className="text-sm font-semibold">Profesor</span>
                  <span className="text-xs text-gray-500">Asignación actual</span>
                </Link>
              </div>
            </div>
          </section>
        )}

        {role === 'TEACHER' && (
          <section className="space-y-4">
            <div className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
              <p className="text-sm font-bold">Acceso rápido</p>
              <div className="mt-4 grid grid-cols-2 gap-3">
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/profesor/alumnos"
                >
                  <span className="material-symbols-outlined text-primary">group</span>
                  <span className="text-sm font-semibold">Alumnos</span>
                  <span className="text-xs text-gray-500">Listado y estado</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/profesor/asistencia"
                >
                  <span className="material-symbols-outlined text-primary">calendar_month</span>
                  <span className="text-sm font-semibold">Asistencia</span>
                  <span className="text-xs text-gray-500">Tomas diarias</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/solicitudes"
                >
                  <span className="material-symbols-outlined text-primary">notifications</span>
                  <span className="text-sm font-semibold">Solicitudes</span>
                  <span className="text-xs text-gray-500">Asignaciones</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/perfil"
                >
                  <span className="material-symbols-outlined text-primary">badge</span>
                  <span className="text-sm font-semibold">Mi perfil</span>
                  <span className="text-xs text-gray-500">Datos y cuotas</span>
                </Link>
              </div>
            </div>
          </section>
        )}

        {role === 'ADMIN' && (
          <section className="space-y-4">
            <div className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
              <p className="text-sm font-bold">Acceso rápido</p>
              <div className="mt-4 grid grid-cols-2 gap-3">
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/profesor/alumnos"
                >
                  <span className="material-symbols-outlined text-primary">group</span>
                  <span className="text-sm font-semibold">Alumnos</span>
                  <span className="text-xs text-gray-500">Gestión total</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/solicitudes"
                >
                  <span className="material-symbols-outlined text-primary">rule_settings</span>
                  <span className="text-sm font-semibold">Aprobaciones</span>
                  <span className="text-xs text-gray-500">Altas y cambios</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/pagos"
                >
                  <span className="material-symbols-outlined text-primary">payments</span>
                  <span className="text-sm font-semibold">Pagos</span>
                  <span className="text-xs text-gray-500">Cobros globales</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light"
                  to="/perfil"
                >
                  <span className="material-symbols-outlined text-primary">shield</span>
                  <span className="text-sm font-semibold">Mi perfil</span>
                  <span className="text-xs text-gray-500">Configuración</span>
                </Link>
                <div className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light">
                  <span className="material-symbols-outlined text-primary">
                    calendar_month
                  </span>
                  <span className="text-sm font-semibold">Generar cuotas</span>
                  <span className="text-xs text-gray-500">
                    Mensualidades del mes
                  </span>
                  <button
                    className="mt-2 w-full rounded-lg bg-primary text-white text-xs font-semibold py-2 disabled:opacity-70"
                    type="button"
                    onClick={handleGenerateFees}
                    disabled={feeLoading}
                  >
                    {feeLoading ? 'Generando...' : 'Generar'}
                  </button>
                  {feeMessage && (
                    <span className="text-[11px] text-gray-500">{feeMessage}</span>
                  )}
                </div>
                <div className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light">
                  <span className="material-symbols-outlined text-primary">
                    payments
                  </span>
                  <span className="text-sm font-semibold">Cuota global</span>
                  <span className="text-xs text-gray-500">
                    Monto mensual base
                  </span>
                  <div className="flex gap-2">
                    <input
                      className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                      type="text"
                      value={feeAmount}
                      onChange={(event) => setFeeAmount(event.target.value)}
                      placeholder="Ej: 7500"
                    />
                    <input
                      className="w-16 rounded-lg border border-gray-200 px-2 py-2 text-sm text-center"
                      type="text"
                      value={feeCurrency}
                      onChange={(event) => setFeeCurrency(event.target.value)}
                    />
                  </div>
                  <button
                    className="mt-2 w-full rounded-lg bg-primary text-white text-xs font-semibold py-2 disabled:opacity-70"
                    type="button"
                    onClick={handleSaveGlobalFee}
                    disabled={feeLoading}
                  >
                    {feeLoading ? 'Guardando...' : 'Guardar cuota'}
                  </button>
                  {feeMessage && (
                    <span className="text-[11px] text-gray-500">{feeMessage}</span>
                  )}
                </div>
              </div>
            </div>
          </section>
        )}
      </main>
    </div>
  );
}
