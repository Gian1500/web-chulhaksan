import { useMemo, useState } from 'react';
import { Link, useLocation } from 'react-router-dom';

type Role = 'STUDENT' | 'TEACHER' | 'ADMIN';

const roleLabels: Record<Role, string> = {
  STUDENT: 'Alumno',
  TEACHER: 'Profesor',
  ADMIN: 'Admin',
};

export function Dashboard() {
  const location = useLocation();
  const queryRole = new URLSearchParams(location.search).get('role') as Role | null;
  const [role, setRole] = useState<Role>(queryRole ?? 'STUDENT');

  const title = useMemo(() => {
    if (role === 'TEACHER') return 'Panel del Profesor';
    if (role === 'ADMIN') return 'Panel de Administración';
    return 'Panel del Alumno';
  }, [role]);

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
            <Link
              className="flex size-10 items-center justify-center"
              to="/dashboard#role-switcher"
              aria-label="Cambiar rol"
            >
              <span className="material-symbols-outlined">apps</span>
            </Link>
          </div>
        </div>
      </header>

      <main className="max-w-md mx-auto p-4 pb-20 space-y-6">
        <section
          className="bg-white rounded-2xl p-4 border border-gray-100 shadow-sm"
          id="role-switcher"
        >
          <p className="text-xs uppercase tracking-[0.2em] text-primary font-bold">
            Cambiar rol (demo)
          </p>
          <div className="mt-3 flex gap-2">
            {(Object.keys(roleLabels) as Role[]).map((key) => (
              <button
                key={key}
                className={`flex-1 h-10 rounded-lg border text-sm font-semibold transition-colors ${
                  role === key
                    ? 'bg-primary text-white border-primary'
                    : 'bg-white text-[#1b0d0d] border-gray-200'
                }`}
                type="button"
                onClick={() => setRole(key)}
              >
                {roleLabels[key]}
              </button>
            ))}
          </div>
        </section>

        {role === 'STUDENT' && (
          <section className="space-y-4">
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
              </div>
            </div>
          </section>
        )}
      </main>
    </div>
  );
}
