import { useEffect, useMemo, useState } from 'react';
import { Link } from 'react-router-dom';
import { apiBaseUrl, getApiHeaders, getToken } from './auth';

type AdminStudent = {
  dni: string;
  firstName: string;
  lastName: string;
  email?: string | null;
  phone?: string | null;
  guardianPhone?: string | null;
  gym?: string | null;
  birthDate?: string | null;
  address?: string | null;
  user?: {
    id: string;
    status: string;
  };
};

type StudentForm = {
  firstName: string;
  lastName: string;
  email: string;
  phone: string;
  guardianPhone: string;
  gym: string;
  birthDate: string;
  address: string;
};

type CreateStudentForm = StudentForm & {
  dni: string;
  password: string;
};

const emptyForm: StudentForm = {
  firstName: '',
  lastName: '',
  email: '',
  phone: '',
  guardianPhone: '',
  gym: '',
  birthDate: '',
  address: '',
};

const emptyCreateForm: CreateStudentForm = {
  ...emptyForm,
  dni: '',
  password: '',
};

export function AdminStudents() {
  const [students, setStudents] = useState<AdminStudent[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [query, setQuery] = useState('');
  const [editing, setEditing] = useState<AdminStudent | null>(null);
  const [form, setForm] = useState<StudentForm>(emptyForm);
  const [saving, setSaving] = useState(false);
  const [createOpen, setCreateOpen] = useState(false);
  const [createForm, setCreateForm] = useState<CreateStudentForm>(emptyCreateForm);
  const [creating, setCreating] = useState(false);
  const [createError, setCreateError] = useState('');
  const [editError, setEditError] = useState('');

  const loadStudents = async () => {
    const token = getToken();
    if (!token) {
      setError('Inicia sesion como admin.');
      setLoading(false);
      return;
    }

    setLoading(true);
    setError('');
    try {
      const response = await fetch(`${apiBaseUrl}/admin/students`, {
        headers: getApiHeaders({ token }),
        cache: 'no-store',
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo cargar el listado.');
      }
      const data = (await response.json()) as AdminStudent[] | { data?: AdminStudent[] };
      const list = Array.isArray(data) ? data : data?.data ?? [];
      setStudents(list);
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

  const filtered = useMemo(() => {
    if (!query.trim()) return students;
    const value = query.toLowerCase();
    return students.filter((student) => {
      const name = `${student.firstName} ${student.lastName}`.toLowerCase();
      return name.includes(value) || student.dni.includes(value);
    });
  }, [students, query]);

  const openEdit = (student: AdminStudent) => {
    setEditing(student);
    setForm({
      firstName: student.firstName ?? '',
      lastName: student.lastName ?? '',
      email: student.email ?? '',
      phone: student.phone ?? '',
      guardianPhone: student.guardianPhone ?? '',
      gym: student.gym ?? '',
      birthDate: student.birthDate ? student.birthDate.split('T')[0] : '',
      address: student.address ?? '',
    });
  };

  const buildPayload = () => ({
    firstName: form.firstName.trim(),
    lastName: form.lastName.trim(),
    email: form.email.trim() || null,
    phone: form.phone.trim() || null,
    guardianPhone: form.guardianPhone.trim() || null,
    gym: form.gym.trim() || null,
    birthDate: form.birthDate.trim() || null,
    address: form.address.trim() || null,
  });

  const handleSave = async (event: React.FormEvent) => {
    event.preventDefault();
    if (!editing) return;
    const token = getToken();
    if (!token) return;
    setSaving(true);
    setError('');
    setEditError('');
    try {
      const response = await fetch(
        `${apiBaseUrl}/admin/students/${editing.dni}`,
        {
          method: 'PATCH',
          headers: getApiHeaders({ token, json: true }),
          body: JSON.stringify(buildPayload()),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo guardar el alumno.');
      }
      setEditing(null);
      setForm(emptyForm);
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo guardar el alumno.';
      setEditError(message);
    } finally {
      setSaving(false);
    }
  };

  const handleCreate = async (event: React.FormEvent) => {
    event.preventDefault();
    const token = getToken();
    if (!token) return;
    setCreating(true);
    setError('');
    setCreateError('');
    try {
      const response = await fetch(`${apiBaseUrl}/admin/users`, {
        method: 'POST',
        headers: getApiHeaders({ token, json: true }),
        body: JSON.stringify({
          role: 'STUDENT',
          dni: createForm.dni.trim(),
          password: createForm.password.trim(),
          firstName: createForm.firstName.trim(),
          lastName: createForm.lastName.trim(),
          email: createForm.email.trim(),
          phone: createForm.phone.trim(),
          guardianPhone: createForm.guardianPhone.trim(),
          gym: createForm.gym.trim(),
          birthDate: createForm.birthDate.trim(),
          address: createForm.address.trim(),
        }),
      });
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo crear el alumno.');
      }
      setCreateOpen(false);
      setCreateForm(emptyCreateForm);
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo crear el alumno.';
      setCreateError(message);
    } finally {
      setCreating(false);
    }
  };

  const handleDelete = async (student: AdminStudent) => {
    if (!confirm(`Eliminar alumno ${student.firstName} ${student.lastName}?`)) {
      return;
    }
    const token = getToken();
    if (!token) return;
    setError('');
    try {
      const response = await fetch(
        `${apiBaseUrl}/admin/students/${student.dni}`,
        {
          method: 'DELETE',
          headers: getApiHeaders({ token }),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo eliminar el alumno.');
      }
      await loadStudents();
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo eliminar el alumno.';
      setError(message);
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
            Editar alumnos
          </h1>
          <button
            className="flex size-10 items-center justify-center"
            type="button"
            onClick={() => setCreateOpen(true)}
            aria-label="Crear alumno"
          >
            <span className="material-symbols-outlined">person_add</span>
          </button>
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
              placeholder="Buscar por DNI o nombre"
              value={query}
              onChange={(event) => setQuery(event.target.value)}
            />
          </div>
        </label>

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

        <div className="flex flex-col gap-3">
          {filtered.map((student) => (
            <div
              key={student.dni}
              className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm"
            >
              <div className="flex items-center gap-3">
                <div className="bg-primary/10 text-primary flex items-center justify-center rounded-full h-12 w-12">
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
              <div className="flex flex-col gap-2">
                <button
                  className="rounded-lg bg-primary text-white text-xs font-semibold px-3 py-2"
                  type="button"
                  onClick={() => openEdit(student)}
                >
                  Editar
                </button>
                <button
                  className="rounded-lg border border-red-200 text-red-600 text-xs font-semibold px-3 py-2"
                  type="button"
                  onClick={() => handleDelete(student)}
                >
                  Eliminar
                </button>
              </div>
            </div>
          ))}
        </div>
      </main>

      {editing && (
        <div className="fixed inset-0 bg-black/40 z-30 flex items-end justify-center">
          <div className="bg-white w-full max-w-[430px] rounded-t-2xl p-5">
            <div className="flex items-center justify-between mb-4">
              <h2 className="text-lg font-bold">Editar alumno</h2>
              <button
                className="text-gray-400"
                type="button"
                onClick={() => setEditing(null)}
              >
                <span className="material-symbols-outlined">close</span>
              </button>
            </div>
            <form className="space-y-3" onSubmit={handleSave}>
              {editError && (
                <div className="rounded-lg border border-red-200 bg-red-50 px-3 py-2 text-xs text-red-700">
                  {editError}
                </div>
              )}
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
                placeholder="Telefono tutor"
                value={form.guardianPhone}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, guardianPhone: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Gimnasio"
                value={form.gym}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, gym: event.target.value }))
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
            <form className="space-y-3" onSubmit={handleCreate}>
              {createError && (
                <div className="rounded-lg border border-red-200 bg-red-50 px-3 py-2 text-xs text-red-700">
                  {createError}
                </div>
              )}
              <div className="grid grid-cols-2 gap-3">
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Nombre"
                  value={createForm.firstName}
                  onChange={(event) =>
                    setCreateForm((prev) => ({
                      ...prev,
                      firstName: event.target.value,
                    }))
                  }
                  required
                />
                <input
                  className="rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  placeholder="Apellido"
                  value={createForm.lastName}
                  onChange={(event) =>
                    setCreateForm((prev) => ({
                      ...prev,
                      lastName: event.target.value,
                    }))
                  }
                  required
                />
              </div>
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="DNI (solo numeros)"
                inputMode="numeric"
                value={createForm.dni}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    dni: event.target.value.replace(/\D/g, ''),
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Email"
                type="email"
                value={createForm.email}
                onChange={(event) =>
                  setCreateForm((prev) => ({ ...prev, email: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Telefono"
                value={createForm.phone}
                onChange={(event) =>
                  setCreateForm((prev) => ({ ...prev, phone: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Telefono tutor"
                value={createForm.guardianPhone}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    guardianPhone: event.target.value,
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Gimnasio"
                value={createForm.gym}
                onChange={(event) =>
                  setCreateForm((prev) => ({ ...prev, gym: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                type="date"
                value={createForm.birthDate}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    birthDate: event.target.value,
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Direccion"
                value={createForm.address}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    address: event.target.value,
                  }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Contraseña"
                type="password"
                value={createForm.password}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    password: event.target.value,
                  }))
                }
                required
              />
              <button
                className="w-full rounded-lg bg-primary text-white text-sm font-semibold py-3 disabled:opacity-70"
                type="submit"
                disabled={creating}
              >
                {creating ? 'Creando...' : 'Crear alumno'}
              </button>
            </form>
          </div>
        </div>
      )}
    </div>
  );
}
