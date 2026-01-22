import { Link } from 'react-router-dom';

export function TeacherStudents() {
  return (
    <div className="relative flex h-full min-h-screen w-full flex-col max-w-[430px] mx-auto bg-background-light shadow-xl overflow-x-hidden">
      <header className="sticky top-0 z-10 flex items-center bg-background-light/80 backdrop-blur-md p-4 pb-2 justify-between">
        <div className="flex items-center gap-2">
          <Link
            className="text-[#1b0d0d] flex size-10 items-center justify-center cursor-pointer"
            to="/"
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
              value=""
              readOnly
            />
          </div>
        </label>
      </div>

      <div className="flex gap-3 px-4 py-2 overflow-x-auto">
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-primary text-white px-5 cursor-pointer shadow-md">
          <p className="text-sm font-semibold leading-normal">Todos</p>
        </div>
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-white border border-gray-100 px-5 cursor-pointer">
          <p className="text-[#1b0d0d] text-sm font-medium leading-normal">
            Al día
          </p>
        </div>
        <div className="flex h-9 shrink-0 items-center justify-center gap-x-2 rounded-full bg-white border border-gray-100 px-5 cursor-pointer">
          <p className="text-[#1b0d0d] text-sm font-medium leading-normal">
            Deuda
          </p>
        </div>
      </div>

      <main className="flex-1 px-4 mt-2 pb-24">
        <div className="flex flex-col gap-2">
          <div className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform cursor-pointer">
          <Link className="flex items-center gap-3" to="/alumno/34567890">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-14 w-14 border-2 border-primary/20"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuDo_6vuNmW2ESzGOPu0uZLZBjwJTUNDS4m7Jy-FInMvDrJ6x8o-VJrkijZjZlmGzD5pUcIaVwHLd2c8Mvdrlg7b2WH0I1XArLFOH8IhpIoFS5qB2BWRiZcWvfUs_g-VlFw0UvPQWxkDbEKJKhahkJB4bXIpgQesCqX0CflPUJJeptLitGU08sCz0DS3Pec8__X1WkWxQ0DdjOqTVr_0BGK4WZz__tu24OdmyD8ejwICK-1zMBSlEoxHeYpa3rfVlFgZ-E_ogluUDnmt")',
              }}
            ></div>
            <div className="flex flex-col justify-center">
              <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                Juan Pérez
              </p>
              <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                DNI: 34.567.890
              </p>
            </div>
          </Link>
            <div className="flex flex-col items-end gap-1">
              <span className="px-2 py-1 rounded-full bg-green-100 text-green-700 text-[10px] font-bold uppercase tracking-wider">
                Al día
              </span>
              <div className="flex size-6 items-center justify-center text-gray-300">
                <span className="material-symbols-outlined text-lg">
                  chevron_right
                </span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform cursor-pointer">
          <Link className="flex items-center gap-3" to="/alumno/40123456">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-14 w-14 border-2 border-primary/20"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuCCJN-3dNXsu_M9FhtvjnpESEi2vPsycOV_iEL1yIi_2Ky-NsH-w8YDr6QSgZrJh4qGNtXme33eN3Wp3Eup5o54_HL_oPXP1-8QIjt2PBEQr2oWrSfo7aYdAFc8I3O7rZXY_ucisDacJYCtG5P_X4cDgxeKAETPu_ujRJe__XoAJFK5MJISUDEuWhqPMbQKm_ZFRZhOCVOK4zf4zfPY5AIbVg52Op8oX7nn1kqEbsKKzrGQMUWrmiKPSMou3XQHR5VZAWCZQc4VxXuw")',
              }}
            ></div>
            <div className="flex flex-col justify-center">
              <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                María García
              </p>
              <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                DNI: 40.123.456
              </p>
            </div>
          </Link>
            <div className="flex flex-col items-end gap-1">
              <span className="px-2 py-1 rounded-full bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-wider">
                Deuda
              </span>
              <div className="flex size-6 items-center justify-center text-gray-300">
                <span className="material-symbols-outlined text-lg">
                  chevron_right
                </span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform cursor-pointer">
          <Link className="flex items-center gap-3" to="/alumno/38902115">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-14 w-14 border-2 border-primary/20"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuBblKe7qWWOgvopNeWfxRQwfCvcDHCLHn29_GmgFKoMbYsOk81tQX8ghGJdIAGKjdbpPVe4xmt3EjC7sv7pxGJyY9dH3AH8dvr440SW8p_-FRuqPpZrXnKLtVNSQ3xezNEXq0u2W3vgJcpLXrs6A1-K_xrV6fO--8WCV7U7OEWulLTicsHrexMPcdmV6kdORTA_a2BjMeswgMzi80PSiixczR-irqo0CLVg5c5n7bQUPlAtmm-oVErrtJGTLNyVq5sxTQSeVMg_5IWA")',
              }}
            ></div>
            <div className="flex flex-col justify-center">
              <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                Carlos Ruiz
              </p>
              <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                DNI: 38.902.115
              </p>
            </div>
          </Link>
            <div className="flex flex-col items-end gap-1">
              <span className="px-2 py-1 rounded-full bg-green-100 text-green-700 text-[10px] font-bold uppercase tracking-wider">
                Al día
              </span>
              <div className="flex size-6 items-center justify-center text-gray-300">
                <span className="material-symbols-outlined text-lg">
                  chevron_right
                </span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform cursor-pointer">
          <Link className="flex items-center gap-3" to="/alumno/42889301">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-14 w-14 border-2 border-primary/20"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuDvOchlQkGW7mvg5L1_g3nJ5ERe_BaPwePhhaHQA7Avm0xpJeEvVPSG-c-eO8CQAC3ziCrjoDeyE1r6MftIaf-maittEh9Y1vSmXt_mWjWp2TDrftFBwxYPhgLg2IC9c2JklzLKNEXM-FMJsq9SGUEWr26K3tFAtgKY5jIyrBfM3Z8rD3FMLBNplTQDNrvn57YIh-ITBQRdpUmdwhBg8aIm6vo-n8VENyWPWUOiGqUzIiGWHs0PCN0fXSbgpe1Rg2fXL8nwbn6qEfSm")',
              }}
            ></div>
            <div className="flex flex-col justify-center">
              <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                Sofía Martínez
              </p>
              <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                DNI: 42.889.301
              </p>
            </div>
          </Link>
            <div className="flex flex-col items-end gap-1">
              <span className="px-2 py-1 rounded-full bg-primary/10 text-primary text-[10px] font-bold uppercase tracking-wider">
                Deuda
              </span>
              <div className="flex size-6 items-center justify-center text-gray-300">
                <span className="material-symbols-outlined text-lg">
                  chevron_right
                </span>
              </div>
            </div>
          </div>

          <div className="flex items-center gap-4 bg-white p-3 rounded-xl justify-between shadow-sm active:scale-95 transition-transform cursor-pointer">
          <Link className="flex items-center gap-3" to="/alumno/35221443">
            <div
              className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-14 w-14 border-2 border-primary/20"
              style={{
                backgroundImage:
                  'url("https://lh3.googleusercontent.com/aida-public/AB6AXuD6EMOcDTcEdQFmg1N4iU7VtZUknS8MJ4VbX6q6fut3nbuEJa98-Eju-wHNoG9FYUX6dthb4-DeasQmc3ircsNYY3efZX1JJcHlRAzFVC9NzXAWpwBLRfCagCQMAlu1_9Mb2y0AOedTlEdoZCy4rB-i_lstQY6yDo5HbbVPR7rRpzaKun8bYNIbYMLobfyX1CFaK3G3YjzL_Z9gNWxIscFZ7iVL8yv426NsT0H4rsw1MtpPPVuQUrZNnWzb2Wt8VqaBlUZf_QbJNH5y")',
              }}
            ></div>
            <div className="flex flex-col justify-center">
              <p className="text-[#1b0d0d] text-base font-semibold leading-tight">
                Pedro Sánchez
              </p>
              <p className="text-[#9a4c4c] text-xs font-medium mt-1">
                DNI: 35.221.443
              </p>
            </div>
          </Link>
            <div className="flex flex-col items-end gap-1">
              <span className="px-2 py-1 rounded-full bg-green-100 text-green-700 text-[10px] font-bold uppercase tracking-wider">
                Al día
              </span>
              <div className="flex size-6 items-center justify-center text-gray-300">
                <span className="material-symbols-outlined text-lg">
                  chevron_right
                </span>
              </div>
            </div>
          </div>
        </div>
      </main>

      <div className="fixed bottom-8 right-8 z-20">
        <button className="flex size-16 items-center justify-center rounded-full bg-primary text-white shadow-lg active:scale-90 transition-transform">
          <span className="material-symbols-outlined text-3xl">person_add</span>
        </button>
      </div>

      <nav className="fixed bottom-0 left-0 right-0 h-20 bg-white/90 backdrop-blur-lg border-t border-gray-100 flex items-center justify-around px-6 z-10 max-w-[430px] mx-auto">
        <Link className="flex flex-col items-center gap-1 text-gray-400" to="/">
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
