import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type StudentItem = {
  dni: string;
  firstName: string;
  lastName: string;
  gym?: string | null;
};

type StudentWithStatus = StudentItem & {
  status: 'OK' | 'DEBT' | 'UNKNOWN';
};

type TabKey = 'assigned' | 'available';

type CreateStudentForm = {
  firstName: string;
  lastName: string;
  dni: string;
  email: string;
  phone: string;
  guardianPhone: string;
  gym: string;
  password: string;
};

const emptyForm: CreateStudentForm = {
  firstName: '',
  lastName: '',
  dni: '',
  email: '',
  phone: '',
  guardianPhone: '',
  gym: '',
  password: '',
};

export function TeacherStudents() {
  const [assigned, setAssigned] = useState<StudentWithStatus[]>([]);
  const [available, setAvailable] = useState<StudentItem[]>([]);
  const [activeTab, setActiveTab] = useState<TabKey>('assigned');
  const [query, setQuery] = useState('');
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [createOpen, setCreateOpen] = useState(false);
  const [form, setForm] = useState<CreateStudentForm>(emptyForm);
  const [saving, setSaving] = useState(false);

  const loadStudents = async () => {
    const token = getToken();
    if (!token) {
      setError('Inicia sesion para ver tus alumnos.');
      setLoading(false);
      return;
    }

    setLoading(true);
    setError('');
    try {
      const [assignedResponse, availableResponse] = await Promise.all([
        fetch(`${apiBaseUrl}/teachers/me/students`, {
          headers: getApiHeaders({ token }),
        }),
        fetch(`${apiBaseUrl}/teachers/me/available-students`, {
          headers: getApiHeaders({ token }),
        }),
      ]);

      if (!assignedResponse.ok) {
        const body = await assignedResponse.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo cargar el listado.');
      }

      if (!availableResponse.ok) {
        const body = await availableResponse.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo cargar el listado.');
      }

      const assignedData = (await assignedResponse.json()) as StudentItem[];
      const availableData = (await availableResponse.json()) as StudentItem[];

      const baseAssigned = (assignedData ?? []).map((student) => ({
        ...student,
        status: 'UNKNOWN' as const,
      }));
      setAssigned(baseAssigned);
      setAvailable(availableData ?? []);

      const statusResults = await Promise.all(
        baseAssigned.map(async (student) => {
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

      setAssigned((current) =>
        current.map((student) => {
          const match = statusResults.find((item) => item.dni === student.dni);
          return match
            ? { ...student, status: match.status as StudentWithStatus['status'] }
            : student;
        }),
      );
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo cargar el listado.';
      setError(message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadStudents();
  }, []);

  const sanitizeDni = (value: string) => value.replace(/\D/g, '');

  const filteredAssigned = useMemo(() => {
    if (!query.trim()) return assigned;
    const value = query.toLowerCase();
    return assigned.filter((student) => {
      const name = `${student.firstName} ${student.lastName}`.toLowerCase();
      return name.includes(value) || student.dni.includes(value);
    });
  }, [assigned, query]);

  const filteredAvailable = useMemo(() => {
    if (!query.trim()) return available;
    const value = query.toLowerCase();
    return available.filter((student) => {
      const name = `${student.firstName} ${student.lastName}`.toLowerCase();
      return name.includes(value) || student.dni.includes(value);
    });
  }, [available, query]);

  const handleAssign = async (dni: string) => {
    const token = getToken();
    if (!token) return;
    try {
      const response = await fetch(
        `${apiBaseUrl}/teachers/me/students/${dni}/assign`,
        {
          method: 'POST',
          headers: getApiHeaders({ token }),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo asignar el alumno.');
      }
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo asignar el alumno.';
      setError(message);
    }
  };

  const handleUnassign = async (dni: string) => {
    const token = getToken();
    if (!token) return;
    try {
      const response = await fetch(
        `${apiBaseUrl}/teachers/me/students/${dni}/unassign`,
        {
          method: 'POST',
          headers: getApiHeaders({ token }),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo desasignar el alumno.');
      }
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo desasignar el alumno.';
      setError(message);
    }
  };

  const handleCreateStudent = async (event: React.FormEvent) => {
    event.preventDefault();
    const token = getToken();
    if (!token) return;
    setSaving(true);
    setError('');
    try {
      const response = await fetch(`${apiBaseUrl}/teachers/me/students`, {
        method: 'POST',
        headers: getApiHeaders({ token, json: true }),
        body: JSON.stringify({
          ...form,
          dni: sanitizeDni(form.dni),
          password: form.password || undefined,
        }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo crear el alumno.');
      }
      setForm(emptyForm);
      setCreateOpen(false);
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo crear el alumno.';
      setError(message);
    } finally {
      setSaving(false);
    }
  };

  const list = activeTab === 'assigned' ? filteredAssigned : filteredAvailable;

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
        <button
          className="flex size-10 cursor-pointer items-center justify-center rounded-full bg-transparent text-[#1b0d0d]"
          type="button"
          onClick={() => setCreateOpen(true)}
          aria-label="Crear alumno"
        >
          <span className="material-symbols-outlined">person_add</span>
        </button>
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
        <button
          className={`flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full px-5 cursor-pointer shadow-md ${
            activeTab === 'assigned'
              ? 'bg-primary text-white'
              : 'bg-white border border-gray-100 text-[#1b0d0d]'
          }`}
          type="button"
          onClick={() => setActiveTab('assigned')}
        >
          <p className="text-sm font-semibold leading-normal">Asignados</p>
        </button>
        <button
          className={`flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full px-5 cursor-pointer ${
            activeTab === 'available'
              ? 'bg-primary text-white'
              : 'bg-white border border-gray-100 text-[#1b0d0d]'
          }`}
          type="button"
          onClick={() => setActiveTab('available')}
        >
          <p className="text-sm font-semibold leading-normal">Disponibles</p>
        </button>
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
        {!loading && !error && list.length === 0 && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            No hay alumnos para mostrar.
          </div>
        )}

        <div className="flex flex-col gap-2">
          {activeTab === 'assigned' &&
            (list as StudentWithStatus[]).map((student) => (
              <div
                key={student.dni}
                className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm"
              >
                <Link
                  className="flex items-center gap-3 flex-1"
                  to={`/alumno/${student.dni}`}
                >
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
                    {student.gym && (
                      <p className="text-[11px] text-gray-500 mt-1">
                        Gimnasio: {student.gym}
                      </p>
                    )}
                  </div>
                </Link>
                <div className="flex flex-col items-end gap-2">
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
                      ? 'Al dia'
                      : student.status === 'DEBT'
                        ? 'Deuda'
                        : 'Sin estado'}
                  </span>
                  <button
                    className="text-[11px] font-semibold text-gray-500 hover:text-primary"
                    type="button"
                    onClick={() => handleUnassign(student.dni)}
                  >
                    Desasignar
                  </button>
                </div>
              </div>
            ))}

          {activeTab === 'available' &&
            (list as StudentItem[]).map((student) => (
              <div
                key={student.dni}
                className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm"
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
                    {student.gym && (
                      <p className="text-[11px] text-gray-500 mt-1">
                        Gimnasio: {student.gym}
                      </p>
                    )}
                  </div>
                </div>
                <button
                  className="rounded-lg bg-primary text-white text-xs font-semibold px-3 py-2"
                  type="button"
                  onClick={() => handleAssign(student.dni)}
                >
                  Asignar
                </button>
              </div>
            ))}
        </div>
      </main>

      {createOpen && (
        <div className="fixed inset-0 bg-black/40 z-30 flex items-end justify-center">
          <div className="bg-white w-full max-w-[430px] rounded-t-2xl p-5">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-bold">Nuevo alumno</h2>
              <button
                className="text-gray-400"
                type="button"
                onClick={() => setCreateOpen(false)}
              >
                <span className="material-symbols-outlined">close</span>
              </button>
            </div>
            <form className="space-y-3" onSubmit={handleCreateStudent}>
              <div className="grid grid-cols-2 gap-3">
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Nombre"
                  value={form.firstName}
                  onChange={(event) =>
                    setForm((prev) => ({ ...prev, firstName: event.target.value }))
                  }
                  required
                />
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Apellido"
                  value={form.lastName}
                  onChange={(event) =>
                    setForm((prev) => ({ ...prev, lastName: event.target.value }))
                  }
                  required
                />
              </div>
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="DNI (solo numeros)"
                inputMode="numeric"
                value={form.dni}
                onChange={(event) =>
                  setForm((prev) => ({
                    ...prev,
                    dni: sanitizeDni(event.target.value),
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Email"
                type="email"
                value={form.email}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, email: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Gimnasio"
                value={form.gym}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, gym: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Telefono del alumno"
                value={form.phone}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, phone: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Telefono tutor"
                value={form.guardianPhone}
                onChange={(event) =>
                  setForm((prev) => ({
                    ...prev,
                    guardianPhone: event.target.value,
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Contrasena"
                type="password"
                value={form.password}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, password: event.target.value }))
                }
                required
              />
              <button
                className="w-full rounded-lg bg-primary text-white text-sm font-semibold py-3 disabled:opacity-70"
                type="submit"
                disabled={saving}
              >
                {saving ? 'Guardando...' : 'Crear alumno'}
              </button>
            </form>
          </div>
        </div>
      )}

      <nav className="fixed bottom-0 left-0 right-0 h-20 bg-white/90 backdrop-blur-lg border-t border-gray-100 flex items-center justify-around px-6 z-10 max-w-[430px] mx-auto">
        <Link className="flex flex-col items-center gap-1 text-gray-400" to="/dashboard">
          <span className="material-symbols-outlined">dashboard</span>
          <span className="text-[10px] font-medium">Inicio</span>
        </Link>
        <div className="flex flex-col items-center gap-1 text-primary" aria-current="page">
          <span
            className="material-symbols-outlined"
            style={{ fontVariationSettings: '\"FILL\" 1' }}
          >
            group
          </span>
          <span className="text-[10px] font-bold">Alumnos</span>
        </div>
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
