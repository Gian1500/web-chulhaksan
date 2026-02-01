import { useEffect, useMemo, useState } from 'react';
import { Link, useNavigate, useSearchParams } from 'react-router-dom';
import type { AuthProfile, UserRole } from './auth';
import { apiBaseUrl, clearAuth, getApiHeaders, getProfile, getToken } from './auth';

const roleLabels: Record<UserRole, string> = {
  STUDENT: 'Alumno',
  TEACHER: 'Profesor',
  ADMIN: 'Administrador',
};

type TeacherSummary = {
  firstName: string;
  lastName: string;
  assignedAt?: string;
};

export function Dashboard() {
  const navigate = useNavigate();
  const [searchParams] = useSearchParams();
  const [profile, setProfile] = useState<AuthProfile | null>(getProfile());
  const [displayName, setDisplayName] = useState('');
  const [teacherSummary, setTeacherSummary] = useState<TeacherSummary | null>(
    null,
  );
  const role = profile?.role ?? 'STUDENT';
  const [feeMessage, setFeeMessage] = useState('');
  const [feeLoading, setFeeLoading] = useState(false);
  const [feeAmount, setFeeAmount] = useState('7500');
  const [feeCurrency, setFeeCurrency] = useState('ARS');
  const [mpMessage, setMpMessage] = useState('');
  const [mpConnected, setMpConnected] = useState(false);

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
      setTeacherSummary(null);
      return;
    }

    const token = getToken();
    if (!token) {
      setDisplayName('');
      setTeacherSummary(null);
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
            const teacherResponse = await fetch(
              `${apiBaseUrl}/students/me/teacher`,
              {
                headers: getApiHeaders({ token }),
              },
            );
            if (teacherResponse.ok) {
              const teacherData =
                (await teacherResponse.json()) as TeacherSummary | null;
              setTeacherSummary(teacherData);
            } else {
              setTeacherSummary(null);
            }
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
            setMpConnected(!!data.mpConnectedAt);
            return;
          }
        }

        if (profile.role === 'ADMIN') {
          setDisplayName('Administrador');
        }
      } catch {
        setDisplayName('');
        setTeacherSummary(null);
        setMpConnected(false);
      }
    };

    loadName();
  }, [profile]);

  useEffect(() => {
    if (searchParams.get('mp') === 'connected') {
      setMpMessage('Mercado Pago conectado.');
    }
  }, [searchParams]);

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

  const handleConnectMp = async () => {
    const token = getToken();
    if (!token) {
      setMpMessage('Iniciá sesión como profesor para conectar Mercado Pago.');
      return;
    }
    setMpMessage('');
    try {
      const response = await fetch(`${apiBaseUrl}/teachers/me/mercadopago/connect`, {
        headers: getApiHeaders({ token }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo iniciar la conexi?n.');
      }
      const data = (await response.json()) as { url?: string };
      if (!data?.url) {
        throw new Error('No se recibió URL de Mercado Pago.');
      }
      window.location.href = data.url;
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo iniciar la conexi?n.';
      setMpMessage(message);
    }
  };

  const handleDisconnectMp = async () => {
    const token = getToken();
    if (!token) {
      setMpMessage('Iniciá sesión como profesor para desconectar.');
      return;
    }
    setMpMessage('');
    try {
      const response = await fetch(
        `${apiBaseUrl}/teachers/me/mercadopago/disconnect`,
        {
          method: 'POST',
          headers: getApiHeaders({ token }),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo desconectar.');
      }
      setMpConnected(false);
      setMpMessage('Mercado Pago desconectado.');
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo desconectar.';
      setMpMessage(message);
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
          <div className="flex items-center justify-between">
            <p className="text-xs uppercase tracking-[0.2em] text-primary font-bold">
              Perfil activo
            </p>
            <span className="text-[10px] font-semibold uppercase tracking-[0.2em] bg-primary/10 text-primary px-2 py-1 rounded-full">
              Activo
            </span>
          </div>
          {profile && (
            <p className="text-sm text-gray-600 mt-1">
              Bienvenido/a{' '}
              <span className="font-semibold text-[#1b0d0d]">
                {roleLabels[role]}
              </span>
            </p>
          )}
          <div className="mt-4 flex items-center gap-4">
            <div className="h-14 w-14 rounded-2xl bg-primary/10 flex items-center justify-center text-primary">
              <span className="material-symbols-outlined">person</span>
            </div>
            <div className="flex-1">
              <p className="text-lg font-bold leading-tight">
                {displayName || (profile ? 'Perfil sin nombre' : 'Inicia sesión')}
              </p>
              <div className="mt-2 flex flex-wrap items-center gap-2 text-xs text-gray-600">
                <span className="rounded-full bg-gray-100 px-2.5 py-1">
                  {profile ? roleLabels[role] : 'Invitado'}
                </span>
                {profile && (
                  <span className="rounded-full bg-gray-100 px-2.5 py-1">
                    DNI: {profile?.dni ?? 'Sin sesión'}
                  </span>
                )}
              </div>
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
                  <p className="text-sm font-semibold">
                    {teacherSummary
                      ? `Prof. ${teacherSummary.firstName} ${teacherSummary.lastName}`
                      : 'Sin profesor asignado'}
                  </p>
                  <p className="text-xs text-gray-500">Asignación actual</p>
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
                  to="/perfil"
                >
                  <span className="material-symbols-outlined text-primary">badge</span>
                  <span className="text-sm font-semibold">Perfil</span>
                  <span className="text-xs text-gray-500">Datos personales</span>
                </Link>
                <div className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light">
                  <span className="material-symbols-outlined text-primary">payments</span>
                  <span className="text-sm font-semibold">Mercado Pago</span>
                  <span className="text-xs text-gray-500">Cobros en tu cuenta</span>
                  <button
                    className={`mt-2 w-full rounded-lg text-white text-xs font-semibold py-2 disabled:opacity-70 ${
                      mpConnected ? 'bg-green-600' : 'bg-primary'
                    }`}
                    type="button"
                    onClick={mpConnected ? handleDisconnectMp : handleConnectMp}
                  >
                    {mpConnected ? 'Desconectar' : 'Conectar'}
                  </button>
                  {mpMessage && (
                    <span className="text-[11px] text-gray-500">{mpMessage}</span>
                  )}
                </div>
              </div>
            </div>
          </section>
        )}

        {role === 'ADMIN' && (
          <section className="space-y-4">
            <div className="bg-white rounded-2xl p-5 border border-gray-100 shadow-sm">
              <p className="text-sm font-bold">Acceso rápido</p>
              <div className="mt-4 grid grid-cols-2 gap-3 items-stretch">
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light h-full"
                  to="/admin/alumnos"
                >
                  <span className="material-symbols-outlined text-primary">group</span>
                  <span className="text-sm font-semibold">Alumnos</span>
                  <span className="text-xs text-gray-500">Gestión total</span>
                </Link>
                <Link
                  className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light h-full"
                  to="/admin/profesores"
                >
                  <span className="material-symbols-outlined text-primary">badge</span>
                  <span className="text-sm font-semibold">Profesores</span>
                  <span className="text-xs text-gray-500">Gestión total</span>
                </Link>
                <div className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light h-full justify-between">
                  <div className="flex flex-col gap-2">
                    <span className="material-symbols-outlined text-primary">
                      calendar_month
                    </span>
                    <span className="text-sm font-semibold">Generar cuotas</span>
                    <span className="text-xs text-gray-500">
                      Mensualidades del mes
                    </span>
                  </div>
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
                <div className="rounded-xl border border-gray-100 p-4 flex flex-col gap-2 bg-background-light h-full justify-between">
                  <div className="flex flex-col gap-2">
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
