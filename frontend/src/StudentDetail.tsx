import { Link } from 'react-router-dom';

export function StudentDetail() {
  return (
    <div className="relative flex h-auto min-h-screen w-full flex-col max-w-[480px] mx-auto overflow-x-hidden border-x border-gray-200 bg-background-light text-[#1b0d0d]">
      <div className="sticky top-0 z-10 flex items-center bg-background-light/90 backdrop-blur-md p-4 pb-2 justify-between border-b border-gray-100">
        <Link
          className="text-[#1b0d0d] flex size-12 shrink-0 items-center cursor-pointer"
          to="/profesor/alumnos"
        >
          <span className="material-symbols-outlined">arrow_back_ios</span>
        </Link>
        <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center">
          Detalle del Alumno
        </h2>
        <div className="flex w-12 items-center justify-end">
          <button className="flex cursor-pointer items-center justify-center overflow-hidden rounded-lg h-12 bg-transparent text-[#1b0d0d] gap-2 text-base font-bold leading-normal min-w-0 p-0">
            <span className="material-symbols-outlined">share</span>
          </button>
        </div>
      </div>

      <div className="flex p-4 @container">
        <div className="flex w-full flex-col gap-4 items-center">
          <div className="flex gap-4 flex-col items-center">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full border-4 border-white shadow-md min-h-32 w-32"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuCtpKfCJSf1dD_3rvWUjvXjbKISNT-oTaT9X8TYYbLWcC5RPKLkGm-l_VMQRZU4FgaaYGppJ8l-iJl3QKrG8f0ZKi1l0k2mQZnGOJPYp_l3Rzi883S5IbcNduBHdHbqsGmeRx89AZwYt32Ib25lMdOhJew5SgwuJmQzUhUsp029QMRbI-AqCl3_lcTkgRFbtrkGfJSPOcMQMUExfLOM-OYpFXtyi7K7t7S06pDfVTjBuKWBjUQts-7PuMnlS6otbQ91QL48lQ75V4oW")',
              }}
            />
            <div className="flex flex-col items-center justify-center">
              <p className="text-[#1b0d0d] text-[24px] font-bold leading-tight tracking-[-0.015em] text-center">
                Juan Pérez González
              </p>
              <div className="mt-2 px-3 py-1 bg-primary text-white text-xs font-bold rounded-full uppercase tracking-wider">
                Cinturón Negro 1er Dan
              </div>
              <p className="text-[#9a4c4c] text-sm font-medium mt-1 leading-normal text-center">
                Alumno Activo desde 2019
              </p>
            </div>
          </div>
        </div>
      </div>

      <div className="px-4 py-2">
        <div className="bg-white rounded-xl p-4 flex justify-around shadow-sm border border-gray-100">
          <div className="flex flex-col items-center">
            <span className="text-[10px] uppercase font-bold text-gray-500 mb-1">
              Pagos
            </span>
            <span className="flex items-center gap-1 text-green-600 font-bold">
              <span className="material-symbols-outlined text-sm">
                check_circle
              </span>
              Al día
            </span>
          </div>
          <div className="w-px h-8 bg-gray-200"></div>
          <div className="flex flex-col items-center">
            <span className="text-[10px] uppercase font-bold text-gray-500 mb-1">
              Edad
            </span>
            <span className="text-[#1b0d0d] font-bold">24 años</span>
          </div>
          <div className="w-px h-8 bg-gray-200"></div>
          <div className="flex flex-col items-center">
            <span className="text-[10px] uppercase font-bold text-gray-500 mb-1">
              Asistencia
            </span>
            <span className="text-[#1b0d0d] font-bold">92%</span>
          </div>
        </div>
      </div>

      <h3 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-6">
        Información Personal
      </h3>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">fingerprint</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            DNI
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            12.345.678-K
          </p>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 justify-between border-b border-gray-100">
        <div className="flex items-center gap-4">
          <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
            <span className="material-symbols-outlined">phone</span>
          </div>
          <div className="flex flex-col justify-center">
            <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Teléfono
            </p>
            <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
              +54 11 6000 0000
            </p>
          </div>
        </div>
        <div className="shrink-0 flex gap-2">
          <div className="text-primary flex size-10 items-center justify-center rounded-full bg-primary/10 cursor-pointer">
            <span className="material-symbols-outlined">chat</span>
          </div>
          <div className="text-green-600 flex size-10 items-center justify-center rounded-full bg-green-100 cursor-pointer">
            <span className="material-symbols-outlined">call</span>
          </div>
        </div>
      </div>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">cake</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Fecha de Nacimiento
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            15 de Mayo, 1999
          </p>
        </div>
      </div>

      <h3 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] px-4 pb-2 pt-6">
        Estado de Pagos
      </h3>

      <div className="flex items-center gap-4 px-4 min-h-[72px] py-2 border-b border-gray-100">
        <div className="text-[#1b0d0d] flex items-center justify-center rounded-lg bg-gray-100 shrink-0 size-12">
          <span className="material-symbols-outlined">payments</span>
        </div>
        <div className="flex flex-col justify-center">
          <p className="text-[#1b0d0d] text-base font-medium leading-normal line-clamp-1">
            Última Cuota
          </p>
          <p className="text-[#9a4c4c] text-sm font-normal leading-normal line-clamp-2">
            Pagado (Septiembre 2023)
          </p>
        </div>
        <div className="ml-auto">
          <span className="material-symbols-outlined text-gray-400">
            chevron_right
          </span>
        </div>
      </div>

      <div className="h-32 bg-transparent"></div>

      <div className="fixed bottom-0 left-0 right-0 max-w-[480px] mx-auto bg-white/80 backdrop-blur-lg p-4 flex gap-3 border-t border-gray-100 shadow-[0_-4px_12px_rgba(0,0,0,0.05)]">
        <button
          className="flex-1 flex items-center justify-center gap-2 h-14 bg-gray-200 text-[#1b0d0d] font-bold rounded-xl active:scale-95 transition-transform"
          type="button"
        >
          <span className="material-symbols-outlined">edit</span>
          Editar Alumno
        </button>
        <button
          className="flex-1 flex items-center justify-center gap-2 h-14 bg-primary text-white font-bold rounded-xl active:scale-95 transition-transform"
          type="button"
        >
          <span className="material-symbols-outlined">delete</span>
          Eliminar
        </button>
      </div>
    </div>
  );
}
