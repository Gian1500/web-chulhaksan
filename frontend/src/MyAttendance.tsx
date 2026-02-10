import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { apiFetch } from './auth';

type Row = {
  id: string;
  date: string;
  present: boolean;
  notes: string | null;
  gym?: { name: string } | null;
};

function formatDate(raw: string) {
  const d = new Date(raw);
  if (Number.isNaN(d.getTime())) return raw;
  return d.toLocaleDateString('es-AR');
}

export function MyAttendance() {
  const navigate = useNavigate();
  const [rows, setRows] = useState<Row[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const load = async () => {
    setLoading(true);
    setError('');
    try {
      const res = await apiFetch('/attendance/me', { method: 'GET', cache: 'no-store' });
      if (!res.ok) {
        const body = await res.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo cargar tu asistencia.');
      }
      const data = (await res.json()) as Row[];
      setRows(Array.isArray(data) ? data : []);
    } catch (err) {
      setError(err instanceof Error ? err.message : 'No se pudo cargar tu asistencia.');
      setRows([]);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    load();
  }, []);

  return (
    <div className="min-h-screen bg-background">
      <header className="w-full max-w-md sm:max-w-lg md:max-w-2xl mx-auto p-4 flex items-center justify-between">
        <button
          className="flex size-10 items-center justify-center"
          type="button"
          onClick={() => navigate(-1)}
          aria-label="Volver"
        >
          <span className="material-symbols-outlined">arrow_back</span>
        </button>
        <h1 className="text-lg font-bold">Mis asistencias</h1>
        <div className="w-10" />
      </header>

      <main className="w-full max-w-md sm:max-w-lg md:max-w-2xl mx-auto p-4 pb-24 space-y-4">
        {loading && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Cargando asistencias...
          </div>
        )}

        {error && (
          <div className="bg-red-50 p-4 rounded-xl text-sm text-red-600 border border-red-200">
            {error}
          </div>
        )}

        {!loading && !error && rows.length === 0 && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Todavia no hay asistencias registradas.
          </div>
        )}

        <div className="flex flex-col gap-3">
          {rows.map((r) => (
            <div
              key={r.id}
              className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm border border-gray-100"
            >
              <div className="flex items-center gap-3 min-w-0">
                <div
                  className={`h-11 w-11 rounded-full flex items-center justify-center border ${
                    r.present
                      ? 'bg-green-50 border-green-200 text-green-700'
                      : 'bg-red-50 border-red-200 text-red-700'
                  }`}
                >
                  <span className="material-symbols-outlined">
                    {r.present ? 'done' : 'close'}
                  </span>
                </div>
                <div className="min-w-0">
                  <p className="text-[#1b0d0d] text-sm font-semibold leading-tight">
                    {formatDate(r.date)}
                  </p>
                  <p className="text-xs text-gray-500 mt-1 truncate">
                    {r.gym?.name ? `Gimnasio: ${r.gym.name}` : 'Gimnasio: -'}
                  </p>
                </div>
              </div>
              <span
                className={`text-xs font-bold rounded-full px-2 py-1 border ${
                  r.present
                    ? 'bg-green-50 text-green-700 border-green-200'
                    : 'bg-red-50 text-red-700 border-red-200'
                }`}
              >
                {r.present ? 'PRESENTE' : 'AUSENTE'}
              </span>
            </div>
          ))}
        </div>

        <div className="text-center pt-2">
          <Link className="text-xs font-semibold text-primary" to="/dashboard">
            Volver al panel
          </Link>
        </div>
      </main>
    </div>
  );
}

