import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { fetchMe, login } from './auth';

export function Login() {
  const navigate = useNavigate();
  const [dni, setDni] = useState('');
  const [password, setPassword] = useState('');
  const [error, setError] = useState('');
  const [loading, setLoading] = useState(false);

  const handleSubmit = async (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setError('');
    setLoading(true);

    try {
      const token = await login(dni.trim(), password);
      await fetchMe(token);
      navigate('/dashboard');
    } catch (err) {
      const message =
        err instanceof Error
          ? err.message
          : 'No se pudo iniciar sesión.';
      setError(message);
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="relative flex min-h-screen w-full flex-col overflow-x-hidden bg-background-light font-display antialiased">
      <div className="h-12 w-full" />
      <div className="flex items-center bg-transparent px-4 py-2">
        <Link
          className="text-[#1a1a2e] flex size-10 shrink-0 items-center justify-start active:opacity-50 transition-opacity"
          to="/"
        >
          <span className="material-symbols-outlined text-2xl font-bold">
            arrow_back_ios
          </span>
        </Link>
      </div>

      <div className="flex-1 flex flex-col items-center px-6">
        <div className="w-full max-w-sm mt-2 mb-8">
          <div
            aria-label="Logo Chul Hak San"
            className="w-full bg-center bg-no-repeat bg-contain flex flex-col justify-center overflow-hidden bg-transparent min-h-[160px]"
            style={{ backgroundImage: 'url("/assets/logo-color.png")' }}
          />
        </div>

        <div className="w-full max-w-sm text-center mb-10">
          <h2 className="text-[#1a1a2e] text-2xl font-bold tracking-tight mb-3">
            Acceso al Portal
          </h2>
          <p className="text-slate-500 text-[15px] leading-relaxed px-4">
            Ingrese su DNI y contraseña para gestionar sus actividades en la
            escuela.
          </p>
        </div>

        <form className="w-full max-w-sm flex flex-col gap-5" onSubmit={handleSubmit}>
          <div className="flex flex-col">
            <label className="flex flex-col w-full">
              <span className="text-[#1a1a2e] text-[12px] font-bold uppercase tracking-[0.05em] mb-2 ml-1 opacity-80">
                Documento de Identidad (DNI)
              </span>
              <div className="relative flex items-center">
                <span className="material-symbols-outlined absolute left-4 text-slate-400">
                  badge
                </span>
                <input
                  className="form-input flex w-full rounded-xl text-[#1a1a2e] border-slate-200 bg-white focus:ring-2 focus:ring-primary/20 focus:border-primary h-[58px] placeholder:text-slate-300 pl-12 pr-4 text-base font-normal transition-all shadow-[0_2px_8px_-2px_rgba(0,0,0,0.05)]"
                  inputMode="numeric"
                  placeholder="Ej: 12.345.678"
                  type="text"
                  value={dni}
                  onChange={(event) => setDni(event.target.value)}
                  required
                />
              </div>
            </label>
          </div>

          <div className="flex flex-col">
            <label className="flex flex-col w-full">
              <span className="text-[#1a1a2e] text-[12px] font-bold uppercase tracking-[0.05em] mb-2 ml-1 opacity-80">
                Contraseña
              </span>
              <div className="relative flex items-center">
                <span className="material-symbols-outlined absolute left-4 text-slate-400">
                  lock
                </span>
                <input
                  className="form-input flex w-full rounded-xl text-[#1a1a2e] border-slate-200 bg-white focus:ring-2 focus:ring-primary/20 focus:border-primary h-[58px] placeholder:text-slate-300 pl-12 pr-12 text-base font-normal transition-all shadow-[0_2px_8px_-2px_rgba(0,0,0,0.05)]"
                  placeholder="••••••••"
                  type="password"
                  value={password}
                  onChange={(event) => setPassword(event.target.value)}
                  required
                />
                <button
                  className="absolute right-4 text-slate-400 hover:text-[#1a1a2e] transition-colors"
                  type="button"
                >
                  <span className="material-symbols-outlined text-xl">
                    visibility
                  </span>
                </button>
              </div>
            </label>
          </div>

          {error && (
            <div className="rounded-xl border border-red-200 bg-red-50 px-4 py-3 text-sm text-red-600">
              {error}
            </div>
          )}

          <div className="mt-2">
            <button
              className="w-full h-[58px] bg-primary text-white font-bold text-base rounded-xl shadow-lg shadow-primary/20 active:scale-[0.98] transition-all flex items-center justify-center gap-3 disabled:opacity-70 disabled:cursor-not-allowed"
              type="submit"
              disabled={loading}
            >
              <span>{loading ? 'Ingresando...' : 'Ingresar al Portal'}</span>
              <span className="material-symbols-outlined text-xl">login</span>
            </button>
          </div>

          <div className="flex justify-center mt-2">
            <Link
              className="text-primary text-[15px] font-medium hover:opacity-80 transition-opacity flex items-center gap-1"
              to="/recuperar"
            >
              ¿Olvidó su contraseña?
            </Link>
          </div>
        </form>
      </div>

      <div className="pb-10 pt-4 text-center">
        <div className="mt-8 flex justify-center">
          <div className="w-32 h-1.5 bg-slate-200 rounded-full" />
        </div>
      </div>
    </div>
  );
}
