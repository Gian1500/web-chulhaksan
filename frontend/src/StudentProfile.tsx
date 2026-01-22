import { Link } from 'react-router-dom';

export function StudentProfile() {
  return (
    <div className="min-h-screen bg-background-light text-[#1b0d0d]">
      <header className="sticky top-0 z-20 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center"
            to="/dashboard"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-tight flex-1 text-center">
            Perfil del Alumno
          </h2>
          <div className="flex w-10 items-center justify-end">
            <span className="material-symbols-outlined">person</span>
          </div>
        </div>
      </header>

      <main className="max-w-md mx-auto pb-24">
        <section className="p-4">
          <div className="bg-white rounded-2xl p-5 shadow-sm border border-gray-100 flex items-center gap-4">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-20 w-20 border-2 border-primary"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuAos5xQbdG0hopRVsTPpirAP0KbSkbwXsF01UGAMj1noMqHm6Vc45_Nq1nXZoQluBpRJRM_3x6J5l3qIiIjj4Kz3hzlnnggc9D3YIpjUGVE82iENCBnwKb_uutYZCpfaEnXcfE-HETPtNWEVy14tzaeDMlXVUtRSyIrkNZMZ6bQegcqEfUuRuhZ_WiJ4u3O6SFgkXkWoAPvIc9jlG0Gm0GkYpSVx-oIviQtjbdgYUF2JMkK9WdFcyjg7hr7ZKMnXz22eTiTHhatuixZ")',
              }}
            />
            <div className="flex flex-col">
              <p className="text-xl font-bold leading-tight">Juan Pérez</p>
              <p className="text-gray-600 text-sm font-medium">
                Cinturón Negro
              </p>
              <p className="text-xs text-gray-500 mt-1">Alumno activo</p>
            </div>
          </div>
        </section>

        <section className="px-4">
          <div className="bg-white rounded-2xl p-4 shadow-sm border border-gray-100">
            <h3 className="text-sm uppercase tracking-[0.2em] text-primary font-bold">
              Profesor Actual
            </h3>
            <div className="mt-3 flex items-center gap-3">
              <div className="h-12 w-12 rounded-full bg-primary/10 flex items-center justify-center text-primary">
                <span className="material-symbols-outlined">sports_martial_arts</span>
              </div>
              <div>
                <p className="text-sm font-semibold">Prof. Ana Martínez</p>
                <p className="text-xs text-gray-500">Asignado desde 2022</p>
              </div>
            </div>
          </div>
        </section>

        <section className="px-4 mt-6 space-y-3">
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm">
            <div className="px-4 py-3 border-b border-gray-100">
              <h3 className="text-base font-bold">Datos Personales</h3>
              <p className="text-xs text-gray-500 mt-1">
                Solo lectura. Contactá a administración si necesitas cambios.
              </p>
            </div>
            <div className="divide-y divide-gray-100">
              <div className="px-4 py-3 flex items-center justify-between">
                <span className="text-sm text-gray-500">DNI</span>
                <span className="text-sm font-semibold">30.123.456</span>
              </div>
              <div className="px-4 py-3 flex items-center justify-between">
                <span className="text-sm text-gray-500">Teléfono</span>
                <span className="text-sm font-semibold">+54 11 6000 0000</span>
              </div>
              <div className="px-4 py-3 flex items-center justify-between">
                <span className="text-sm text-gray-500">Email</span>
                <span className="text-sm font-semibold">
                  juan@mail.com
                </span>
              </div>
              <div className="px-4 py-3 flex items-center justify-between">
                <span className="text-sm text-gray-500">Dirección</span>
                <span className="text-sm font-semibold">
                  Av. Siempre Viva 123
                </span>
              </div>
              <div className="px-4 py-3 flex items-center justify-between">
                <span className="text-sm text-gray-500">Nacimiento</span>
                <span className="text-sm font-semibold">15/05/1999</span>
              </div>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
