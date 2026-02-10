import { useEffect, useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { apiFetch } from './auth';

type FormLinkItem = {
  id: string;
  title: string;
  url: string;
  order: number;
};

export function MyForms() {
  const navigate = useNavigate();
  const [forms, setForms] = useState<FormLinkItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const load = async () => {
      setLoading(true);
      setError('');
      try {
        const res = await apiFetch('/forms/me', { method: 'GET', cache: 'no-store' });
        if (!res.ok) {
          const body = await res.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudo cargar el listado.');
        }
        const list = (await res.json()) as FormLinkItem[];
        setForms(Array.isArray(list) ? list : []);
      } catch (err) {
        setError(err instanceof Error ? err.message : 'No se pudo cargar el listado.');
      } finally {
        setLoading(false);
      }
    };
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
        <h1 className="text-lg font-bold">Formas</h1>
        <div className="w-10" />
      </header>

      <main className="w-full max-w-md sm:max-w-lg md:max-w-2xl mx-auto p-4 pb-24 space-y-4">
        {loading && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Cargando formas...
          </div>
        )}
        {error && (
          <div className="bg-red-50 p-4 rounded-xl text-sm text-red-600 border border-red-200">
            {error}
          </div>
        )}
        {!loading && !error && forms.length === 0 && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Todavía no tenés formas desbloqueadas.
          </div>
        )}

        <div className="flex flex-col gap-3">
          {forms.map((form) => (
            <a
              key={form.id}
              href={form.url}
              target="_blank"
              rel="noreferrer"
              className="flex items-center gap-3 bg-white p-3 rounded-xl justify-between shadow-sm border border-gray-100"
            >
              <div className="flex items-center gap-3 min-w-0">
                <div className="bg-primary/10 text-primary flex items-center justify-center rounded-full h-12 w-12">
                  <span className="material-symbols-outlined">link</span>
                </div>
                <div className="flex flex-col justify-center min-w-0">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-tight truncate">
                    {form.title}
                  </p>
                  <p className="text-xs text-gray-500 mt-1">Orden: {form.order}</p>
                </div>
              </div>
              <span className="material-symbols-outlined text-gray-400">open_in_new</span>
            </a>
          ))}
        </div>

        <div className="pt-2 text-center">
          <Link className="text-xs font-semibold text-primary" to="/dashboard">
            Volver al panel
          </Link>
        </div>
      </main>
    </div>
  );
}

