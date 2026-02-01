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
  assignments?: {
    teacher?: {
      id: string;
      firstName: string;
      lastName: string;
    } | null;
  }[];
  user?: {
    id: string;
    status: string;
  };
};

type AdminTeacherOption = {
  id: string;
  firstName: string;
  lastName: string;
  user?: {
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
  const [teachers, setTeachers] = useState<AdminTeacherOption[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');
  const [query, setQuery] = useState('');
  const [editing, setEditing] = useState<AdminStudent | null>(null);
  const [form, setForm] = useState<StudentForm>(emptyForm);
  const [assignedTeacherId, setAssignedTeacherId] = useState('');
  const [initialTeacherId, setInitialTeacherId] = useState('');
  const [saving, setSaving] = useState(false);
  const [createOpen, setCreateOpen] = useState(false);
  const [createForm, setCreateForm] = useState<CreateStudentForm>(emptyCreateForm);
  const [createAssignedTeacherId, setCreateAssignedTeacherId] = useState('');
  const [creating, setCreating] = useState(false);
  const [createError, setCreateError] = useState('');
  const [showPassword, setShowPassword] = useState(false);
  const [editError, setEditError] = useState('');
  const [resetInfo, setResetInfo] = useState('');
  const [resetting, setResetting] = useState(false);
  const [copiedReset, setCopiedReset] = useState(false);

  const loadStudents = async () => {
    const token = getToken();
    if (!token) {
      setError('Iniciá sesión como admin.');
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

  const loadTeachers = async () => {
    const token = getToken();
    if (!token) return;
    try {
      const response = await fetch(`${apiBaseUrl}/admin/teachers`, {
        headers: getApiHeaders({ token }),
        cache: 'no-store',
      });
      if (!response.ok) {
        return;
      }
      const data =
        (await response.json()) as AdminTeacherOption[] | { data?: AdminTeacherOption[] };
      const list = Array.isArray(data) ? data : data?.data ?? [];
      setTeachers(list);
    } catch {
      // ignore
    }
  };

  useEffect(() => {
    loadStudents();
    loadTeachers();
  }, []);

  const filtered = useMemo(() => {
    if (!query.trim()) return students;
    const value = query.toLowerCase();
    return students.filter((student) => {
      const name = `${student.firstName} ${student.lastName}`.toLowerCase();
      return name.includes(value) || student.dni.includes(value);
    });
  }, [students, query]);

  const activeTeachers = useMemo(
    () =>
      teachers.filter((teacher) => {
        if (!teacher.user?.status) return true;
        return teacher.user.status === 'ACTIVE';
      }),
    [teachers],
  );

  const openEdit = (student: AdminStudent) => {
    const currentTeacherId = student.assignments?.[0]?.teacher?.id ?? '';
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
    setAssignedTeacherId(currentTeacherId);
    setInitialTeacherId(currentTeacherId);
    setResetInfo('');
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
      if (assignedTeacherId !== initialTeacherId) {
        const endpoint = assignedTeacherId
          ? `${apiBaseUrl}/admin/students/${editing.dni}/assign`
          : `${apiBaseUrl}/admin/students/${editing.dni}/unassign`;
        const assignResponse = await fetch(endpoint, {
          method: 'POST',
          headers: getApiHeaders({ token, json: !!assignedTeacherId }),
          body: assignedTeacherId
            ? JSON.stringify({ teacherId: assignedTeacherId })
            : undefined,
        });
        if (!assignResponse.ok) {
          const body = await assignResponse.json().catch(() => ({}));
          throw new Error(
            body.message ?? 'No se pudo actualizar la asignación del profesor.',
          );
        }
      }
      setEditing(null);
      setForm(emptyForm);
      setAssignedTeacherId('');
      setInitialTeacherId('');
      setResetInfo('');
      setCreateAssignedTeacherId('');
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
      if (createAssignedTeacherId) {
        const assignResponse = await fetch(
          `${apiBaseUrl}/admin/students/${createForm.dni.trim()}/assign`,
          {
            method: 'POST',
            headers: getApiHeaders({ token, json: true }),
            body: JSON.stringify({ teacherId: createAssignedTeacherId }),
          },
        );
        if (!assignResponse.ok) {
          const body = await assignResponse.json().catch(() => ({}));
          throw new Error(
            body.message ??
              'Alumno creado, pero no se pudo asignar el profesor.',
          );
        }
      }
      setCreateOpen(false);
      setCreateForm(emptyCreateForm);
      setCreateAssignedTeacherId('');
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

  const handleResetPassword = async () => {
    if (!editing?.user?.id) {
      setEditError('No se pudo identificar el usuario.');
      return;
    }
    if (!confirm('¿Querés resetear la contraseña de este alumno?')) return;
    const token = getToken();
    if (!token) return;
    setResetting(true);
    setEditError('');
    try {
      const response = await fetch(
        `${apiBaseUrl}/admin/users/${editing.user.id}/reset-password`,
        {
          method: 'POST',
          headers: getApiHeaders({ token }),
        },
      );
      if (!response.ok) {
        const body = await response.json().catch(() => ({}));
        throw new Error(body.message ?? 'No se pudo resetear la contraseña.');
      }
      const data = (await response.json()) as { temporaryPassword?: string };
      if (!data?.temporaryPassword) {
        throw new Error('No se recibió la contraseña temporal.');
      }
      setResetInfo(data.temporaryPassword);
    } catch (err) {
      const message =
        err instanceof Error ? err.message : 'No se pudo resetear la contraseña.';
      setEditError(message);
    } finally {
      setResetting(false);
    }
  };

  const handleCopyReset = async () => {
    if (!resetInfo) return;
    try {
      if (navigator.clipboard?.writeText) {
        await navigator.clipboard.writeText(resetInfo);
      } else {
        const textarea = document.createElement('textarea');
        textarea.value = resetInfo;
        textarea.style.position = 'fixed';
        textarea.style.opacity = '0';
        document.body.appendChild(textarea);
        textarea.select();
        document.execCommand('copy');
        document.body.removeChild(textarea);
      }
      setCopiedReset(true);
      setTimeout(() => setCopiedReset(false), 1500);
    } catch {
      setCopiedReset(false);
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
            Gestión de alumnos
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
                onClick={() => {
                  setEditing(null);
                  setForm(emptyForm);
                  setAssignedTeacherId('');
                  setInitialTeacherId('');
                  setResetInfo('');
                }}
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
                placeholder="Correo electrónico"
                type="email"
                value={form.email}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, email: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Teléfono"
                value={form.phone}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, phone: event.target.value }))
                }
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Teléfono tutor"
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
              <div className="relative">
                <input
                  className="peer w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  type="date"
                  placeholder="Fecha de nacimiento"
                  value={form.birthDate}
                  onChange={(event) =>
                    setForm((prev) => ({ ...prev, birthDate: event.target.value }))
                  }
                />
                <div className="pointer-events-none absolute -top-3 left-1/2 -translate-x-1/2 rounded-full border border-gray-200 bg-white px-2 py-0.5 text-[10px] text-gray-500 opacity-0 shadow-sm transition-opacity peer-focus:opacity-100">
                  Seleccioná la fecha de nacimiento
                </div>
              </div>
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Dirección"
                value={form.address}
                onChange={(event) =>
                  setForm((prev) => ({ ...prev, address: event.target.value }))
                }
              />
              <div className="space-y-1">
                <label className="text-xs text-gray-500">Profesor asignado</label>
                <select
                  className="w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm"
                  value={assignedTeacherId}
                  onChange={(event) => setAssignedTeacherId(event.target.value)}
                >
                  <option value="">Sin profesor</option>
                  {activeTeachers.map((teacher) => (
                    <option key={teacher.id} value={teacher.id}>
                      {teacher.firstName} {teacher.lastName}
                    </option>
                  ))}
                </select>
              </div>
              <div className="rounded-lg border border-gray-100 bg-background-light p-3 space-y-2">
                <p className="text-xs text-gray-500">Contraseña del alumno</p>
                <button
                  className="w-full rounded-lg border border-gray-200 text-sm font-semibold py-2 disabled:opacity-70"
                  type="button"
                  onClick={handleResetPassword}
                  disabled={resetting}
                >
                  {resetting ? 'Reseteando...' : 'Resetear contraseña'}
                </button>
                {resetInfo && (
                  <div className="rounded-md border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-700 flex items-center justify-between gap-2">
                    <span>Temporal: {resetInfo}</span>
                    <button
                      className={`text-xs font-semibold transition-all ${
                        copiedReset
                          ? 'text-green-700 bg-green-100 px-2 py-1 rounded-md scale-[1.03]'
                          : 'text-amber-700'
                      }`}
                      type="button"
                      onClick={handleCopyReset}
                    >
                      {copiedReset ? 'Copiado' : 'Copiar'}
                    </button>
                  </div>
                )}
              </div>
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
                onClick={() => {
                  setCreateOpen(false);
                  setCreateForm(emptyCreateForm);
                  setCreateAssignedTeacherId('');
                }}
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
                placeholder="Correo electrónico"
                type="email"
                value={createForm.email}
                onChange={(event) =>
                  setCreateForm((prev) => ({ ...prev, email: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Teléfono"
                value={createForm.phone}
                onChange={(event) =>
                  setCreateForm((prev) => ({ ...prev, phone: event.target.value }))
                }
                required
              />
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Teléfono tutor"
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
              <div className="relative">
                <input
                  className="peer w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                  type="date"
                  placeholder="Fecha de nacimiento"
                  value={createForm.birthDate}
                  onChange={(event) =>
                    setCreateForm((prev) => ({
                      ...prev,
                      birthDate: event.target.value,
                    }))
                  }
                  required
                />
                <div className="pointer-events-none absolute -top-3 left-1/2 -translate-x-1/2 rounded-full border border-gray-200 bg-white px-2 py-0.5 text-[10px] text-gray-500 opacity-0 shadow-sm transition-opacity peer-focus:opacity-100">
                  Seleccioná la fecha de nacimiento
                </div>
              </div>
              <input
                className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm"
                placeholder="Dirección"
                value={createForm.address}
                onChange={(event) =>
                  setCreateForm((prev) => ({
                    ...prev,
                    address: event.target.value,
                  }))
                }
                required
              />
              <div className="relative">
                <input
                  className="w-full rounded-lg border border-gray-200 px-3 py-2 text-sm pr-10"
                  placeholder="Contraseña"
                  type={showPassword ? 'text' : 'password'}
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
                  className="absolute inset-y-0 right-3 flex items-center text-gray-400"
                  type="button"
                  onClick={() => setShowPassword((current) => !current)}
                  aria-label={showPassword ? 'Ocultar contraseña' : 'Ver contraseña'}
                >
                  <span className="material-symbols-outlined text-lg">
                    {showPassword ? 'visibility_off' : 'visibility'}
                  </span>
                </button>
              </div>
              <div className="space-y-1">
                <label className="text-xs text-gray-500">Profesor asignado</label>
                <select
                  className="w-full rounded-lg border border-gray-200 bg-white px-3 py-2 text-sm"
                  value={createAssignedTeacherId}
                  onChange={(event) => setCreateAssignedTeacherId(event.target.value)}
                >
                  <option value="">Sin profesor</option>
                  {activeTeachers.map((teacher) => (
                    <option key={teacher.id} value={teacher.id}>
                      {teacher.firstName} {teacher.lastName}
                    </option>
                  ))}
                </select>
              </div>
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
