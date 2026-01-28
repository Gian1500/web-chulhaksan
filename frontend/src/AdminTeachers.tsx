import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type AdminTeacher = {
  id: string;
  firstName: string;
  lastName: string;
  email?: string | null;
  phone?: string | null;
  birthDate?: string | null;
  address?: string | null;
  gyms?: string[] | null;
  user?: {
    id: string;
    status: string;
  };
};

type TeacherForm = {
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  birthDate: string;
  address: string;
  gyms: string;
};

const emptyForm: TeacherForm = {
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  birthDate: '',
  address: '',
  gyms: '',
};

export function AdminTeachers() {
  const [teachers, setTeachers] = useState<AdminTeacher[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [query, setQuery] = useState('');
  const [editing, setEditing] = useState<AdminTeacher | null>(null);
  const [form, setForm] = useState<TeacherForm>(emptyForm);
  const [saving, setSaving] = useState(false);

  const loadTeachers = async () => {
    const token = getToken();
    if (!token) {
      setError('Inicia sesion como admin.');
      setLoading(false);
      return;
    }

    setLoading(true);
    setError('');
    try {
      const response = await fetch(`${apiBaseUrl}/admin/teachers`, {
        headers: getApiHeaders({ token }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo cargar el listado.');
      }
      const data = (await response.json()) as AdminTeacher[];
      setTeachers(data ?? []);
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo cargar el listado.';
      setError(message);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadTeachers();
  }, []);

  const filtered = useMemo(() => {
    if (!query.trim()) return teachers;
    const value = query.toLowerCase();
    return teachers.filter((teacher) => {
      const name = `${teacher.firstName} ${teacher.lastName}`.toLowerCase();
      return name.includes(value);
    });
  }, [teachers, query]);

  const openEdit = (teacher: AdminTeacher) => {
    setEditing(teacher);
    setForm({
      firstName: teacher.firstName ?? '',
      lastName: teacher.lastName ?? '',
      email: teacher.email ?? '',
      phone: teacher.phone ?? '',
      birthDate: teacher.birthDate ? teacher.birthDate.split('T')[0] : '',
      address: teacher.address ?? '',
      gyms: teacher.gyms && teacher.gyms.length > 0 ? teacher.gyms.join(', ') : '',
    });
  };

  const buildPayload = () => {
    const payload: Record<string, string | string[]> = {};
    if (form.firstName.trim()) payload.firstName = form.firstName.trim();
    if (form.lastName.trim()) payload.lastName = form.lastName.trim();
    if (form.email.trim()) payload.email = form.email.trim();
    if (form.phone.trim()) payload.phone = form.phone.trim();
    if (form.birthDate.trim()) payload.birthDate = form.birthDate.trim();
    if (form.address.trim()) payload.address = form.address.trim();
    if (form.gyms.trim()) {
      payload.gyms = form.gyms
        .split(',')
        .map((item) => item.trim())
        .filter(Boolean);
    }
    return payload;
  };

  const handleSave = async (event: React.FormEvent) => {
    event.preventDefault();
    if (!editing) return;
    const token = getToken();
    if (!token) return;
    setSaving(true);
    setError('');
    try {
      const response = await fetch(
        `${apiBaseUrl}/admin/teachers/${editing.id}`,
        {
          method: 'PATCH',
          headers: getApiHeaders({ token, json: true }),
          body: JSON.stringify(buildPayload()),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo guardar el profesor.');
      }
      setEditing(null);
      setForm(emptyForm);
      await loadTeachers();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo guardar el profesor.';
      setError(message);
    } finally {
      setSaving(false);
    }
  };

  return (
    <div className="min-h-screen bg-background-light text-[#1b0d0d]">
      <header className="sticky top-0 z-10 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center"
            to="/dashboard"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h1 className="text-lg font-bold leading-tight tracking-tight flex-1 text-center pr-10">
            Editar profesores
          </h1>
        </div>
      </header>

      <main className="max-w-md mx-auto p-4 pb-24 space-y-4">
        <label className="flex flex-col min-w-40 h-12 w-full">
          <div className="flex w-full flex-1 items-stretch rounded-xl h-full shadow-sm">
            <div className="text-[#9a4c4c] flex border-none bg-white items-center justify-center pl-4 rounded-l-xl border-r-0">
              <span className="material-symbols-outlined">search</span>
            </div>
            <input
              className="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-r-xl text-[#1b0d0d] focus:outline-0 focus:ring-0 border-none bg-white focus:border-none h-full placeholder:text-[#9a4c4c] px-4 pl-2 text-base font-normal leading-normal"
              placeholder="Buscar por nombre"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
            />
          </div>
        </label>

        {loading && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            Cargando profesores...
          </div>
        )}
        {error && (
          <div className="bg-red-50 p-4 rounded-xl text-sm text-red-600 border border-red-200">
            {error}
          </div>
        )}
        {!loading && !error && filtered.length === 0 && (
          <div className="bg-white p-4 rounded-xl text-sm text-gray-500 border border-gray-100">
            No hay profesores para mostrar.
          </div>
        )}

        <div className="flex flex-col gap-3">
          {filtered.map((teacher) => (
            <div
              key={teacher.id}
              className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm"
            >
              <div className="flex items-center gap-3">
                <div className="bg-primary/10 text-primary flex items-center justify-center rounded-full h-12 w-12">
                  <span className="material-symbols-outlined">badge</span>
                </div>
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                    {teacher.firstName} {teacher.lastName}
                  </p>
                  {teacher.email && (
                    <p className="text-[11px] text-gray-500 mt-1">
                      {teacher.email}
                    </p>
                  )}
                </div>
              </div>
              <button
                className="rounded-lg bg-primary text-white text-xs font-semibold px-3 py-2"
                type="button"
                onClick={() => openEdit(teacher)}
              >
                Editar
              </button>
            </div>
          ))}
        </div>
      </main>

      {editing && (
        <div className="fixed inset-0 bg-black/40 z-30 flex items-end justify-center">
          <div className="bg-white w-full max-w-[430px] rounded-t-2xl p-5">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-bold">Editar profesor</h2>
              <button
                className="text-gray-400"
                type="button"
                onClick={() => setEditing(null)}
              >
                <span className="material-symbols-outlined">close</span>
              </button>
            </div>
            <form className="space-y-3" onSubmit={handleSave}>
              <div className="grid grid-cols-2 gap-3">
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Nombre"
                  value={form.firstName}
                  onChange={(event) =>
                    setForm((prev) => ({ ...prev, firstName: event.target.value }))
                  }
                />
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Apellido"
                  value={form.lastName}
                  onChange={(event) =>
                    setForm((prev) => ({ ...prev, lastName: event.target.value }))
                  }
                />
              </div>
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Email"
                type="email"
                value={form.email}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, email: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Telefono"
                value={form.phone}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, phone: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                type="date"
                value={form.birthDate}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, birthDate: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Direccion"
                value={form.address}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, address: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Gimnasios (separados por coma)"
                value={form.gyms}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, gyms: event.target.value }))
                }
              />
              <button
                className="w-full rounded-lg bg-primary text-white text-sm font-semibold py-3 disabled:opacity-70"
                type="submit"
                disabled={saving}
              >
                {saving ? 'Guardando...' : 'Guardar cambios'}
              </button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
