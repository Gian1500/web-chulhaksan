import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type StudentItem = {
  dni: string;
  firstName: string;
  lastName: string;
};

type StudentWithStatus = StudentItem & {
  status: 'OK' | 'DEBT' | 'UNKNOWN';
};

export function TeacherStudents() {
  const [students, setStudents] = useState<StudentWithStatus[]>([]);
  const [query, setQuery] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const token = getToken();
    if (!token) {
      setError('Iniciá sesión para ver tus alumnos.');
      setLoading(false);
      return;
    }

    const loadStudents = async () => {
      try {
        const response = await fetch(`${apiBaseUrl}/teachers/me/students`, {
          headers: getApiHeaders({ token }),
        });
        if (!response.ok) {
          const body = await response.json().catch(() => ({}));
          throw new Error(body.message ?? 'No se pudo cargar el listado.');
        }
        const data = (await response.json()) as StudentItem[];
        const baseStudents = (data ?? []).map((student) => ({
          ...student,
          status: 'UNKNOWN' as const,
        }));
        setStudents(baseStudents);

        const statusResults = await Promise.all(
          baseStudents.map(async (student) => {
            const feeResponse = await fetch(
              `${apiBaseUrl}/fees/student/${student.dni}`,
              { headers: getApiHeaders({ token }) },
            );
            if (!feeResponse.ok) {
              return { dni: student.dni, status: 'UNKNOWN' as const };
            }
            const fees = await feeResponse.json();
            const hasDebt = Array.isArray(fees)
              ? fees.some((fee) => fee.status === 'PENDING')
              : false;
            return { dni: student.dni, status: hasDebt ? 'DEBT' : 'OK' };
          }),
        );

        setStudents((current) =>
          current.map((student) => {
            const match = statusResults.find((item) => item.dni === student.dni);
            return match ? { ...student, status: match.status } : student;
          }),
        );
      } catch (err) {
        const message =
          err instanceof Error
            ? err.message
            : 'No se pudo cargar el listado.';
        setError(message);
      } finally {
        setLoading(false);
      }
    };

    loadStudents();
  }, []);

  const filtered = useMemo(() => {
    if (!query.trim()) return students;
    const value = query.toLowerCase();
    return students.filter((student) => {
      const name = `${student.firstName} ${student.lastName}`.toLowerCase();
      return name.includes(value) || student.dni.includes(value);
    });
  }, [students, query]);

  return (
    <div className="relative flex h-full min-h-screen w-full flex-col max-w-[430px] mx-auto bg-background-light shadow-xl overflow-x-hidden">
      <header className="sticky top-0 z-10 flex items-center bg-background-light/80 backdrop-blur-md p-4 pb-2 justify-between">
        <div className="flex items-center gap-2">
          <Link
            className="text-[#1b0d0d] flex size-10 items-center justify-center cursor-pointer"
            to="/dashboard"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h1 className="text-[#1b0d0d] text-xl font-bold leading-tight tracking-tight">
            Alumnos
          </h1>
        </div>
        <div className="flex w-10 items-center justify-end">
          <Link
            className="flex size-10 cursor-pointer items-center justify-center rounded-full bg-transparent text-[#1b0d0d]"
            to="/solicitudes"
          >
            <span className="material-symbols-outlined">notifications</span>
          </Link>
        </div>
      </header>

      <div className="px-4 py-3">
        <label className="flex flex-col min-w-40 h-12 w-full">
          <div className="flex w-full flex-1 items-stretch rounded-xl h-full shadow-sm">
            <div className="text-[#9a4c4c] flex border-none bg-white items-center justify-center pl-4 rounded-l-xl border-r-0">
              <span className="material-symbols-outlined">search</span>
            </div>
            <input
              className="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-r-xl text-[#1b0d0d] focus:outline-0 focus:ring-0 border-none bg-white focus:border-none h-full placeholder:text-[#9a4c4c] px-4 pl-2 text-base font-normal leading-normal"
              placeholder="Buscar por DNI o nombre"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
            />
          </div>
        </label>
      </div>

      <div className="flex gap-3 px-4 py-2 overflow-x-auto">
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-primary text-white px-5 cursor-pointer shadow-md">
          <p className="text-sm font-semibold leading-normal">Todos</p>
        </div>
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-white border border-gray-100 px-5 opacity-50">
          <p className="text-[#1b0d0d] text-sm font-medium leading-normal">
            Al día
          </p>
        </div>
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-white border border-gray-100 px-5 opacity-50">
          <p className="text-[#1b0d0d] text-sm font-medium leading-normal">
            Deuda
          </p>
        </div>
      </div>

      <main className="flex-1 px-4 mt-2 pb-24">
        {loading && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Cargando alumnos...
          </div>
        )}
        {error && (
          <div className="bg-red-50 p-4 rounded-xl text-sm text-red-600 border border-red-200">
            {error}
          </div>
        )}
        {!loading && !error && filtered.length === 0 && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            No hay alumnos para mostrar.
          </div>
        )}

        <div className="flex flex-col gap-2">
          {filtered.map((student) => (
            <Link
              key={student.dni}
              className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform"
              to={`/alumno/${student.dni}`}
            >
              <div className="flex items-center gap-3">
                <div className="bg-primary/10 text-primary flex items-center justify-center rounded-full h-14 w-14">
                  <span className="material-symbols-outlined">person</span>
                </div>
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                    {student.firstName} {student.lastName}
                  </p>
                  <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                    DNI: {student.dni}
                  </p>
                </div>
              </div>
              <div className="flex flex-col items-end gap-1">
                <span
                  className={`px-2 py-1 rounded-full text-[10px] font-bold uppercase tracking-wider ${
                    student.status === 'OK'
                      ? 'bg-green-100 text-green-700'
                      : student.status === 'DEBT'
                        ? 'bg-primary/10 text-primary'
                        : 'bg-gray-100 text-gray-500'
                  }`}
                >
                  {student.status === 'OK'
                    ? 'Al día'
                    : student.status === 'DEBT'
                      ? 'Deuda'
                      : 'Sin estado'}
                </span>
                <div className="flex size-6 items-center justify-center text-gray-300">
                  <span className="material-symbols-outlined text-lg">
                    chevron_right
                  </span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </main>

      <div className="fixed bottom-8 right-8 z-20">
        <button className="flex size-16 items-center justify-center rounded-full bg-primary text-white shadow-lg active:scale-90 transition-transform">
          <span className="material-symbols-outlined text-3xl">person_add</span>
        </button>
      </div>

      <nav className="fixed bottom-0 left-0 right-0 h-20 bg-white/90 backdrop-blur-lg border-t border-gray-100 flex items-center justify-around px-6 z-10 max-w-[430px] mx-auto">
        <Link className="flex flex-col items-center gap-1 text-gray-400" to="/dashboard">
          <span className="material-symbols-outlined">dashboard</span>
          <span className="text-[10px] font-medium">Inicio</span>
        </Link>
        <div className="flex flex-col items-center gap-1 text-primary" aria-current="page">
          <span
            className="material-symbols-outlined"
            style={{ fontVariationSettings: '"FILL" 1' }}
          >
            group
          </span>
          <span className="text-[10px] font-bold">Alumnos</span>
        </div>
        <Link
          className="flex flex-col items-center gap-1 text-gray-400"
          to="/profesor/asistencia"
        >
          <span className="material-symbols-outlined">calendar_today</span>
          <span className="text-[10px] font-medium">Clases</span>
        </Link>
        <Link
          className="flex flex-col items-center gap-1 text-gray-400"
          to="/login"
        >
          <span className="material-symbols-outlined">logout</span>
          <span className="text-[10px] font-medium">Salir</span>
        </Link>
      </nav>
    </div>
  );
}
