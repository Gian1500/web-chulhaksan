import { Link } from 'react-router-dom';

export function Requests() {
  return (
    <div className="bg-background-light min-h-screen flex flex-col">
      <header className="sticky top-0 z-20 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center"
            to="/profesor/alumnos"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-tight flex-1 text-center">
            Solicitudes
          </h2>
          <div className="flex w-10 items-center justify-end">
            <button className="text-[#1b0d0d]">
              <span className="material-symbols-outlined">tune</span>
            </button>
          </div>
        </div>
      </header>

      <main className="flex-1 max-w-md mx-auto w-full pb-24">
        <section className="px-4 py-4">
          <div className="bg-white rounded-xl p-4 border border-gray-100 shadow-sm">
            <p className="text-xs uppercase tracking-[0.2em] text-primary font-bold">
              Pendientes
            </p>
            <p className="text-sm text-gray-600 mt-2">
              Acepta o rechaza solicitudes de alumnos y profesores.
            </p>
          </div>
        </section>

        <section className="px-4 space-y-3">
          <div className="bg-white rounded-xl p-4 border border-gray-100 shadow-sm">
            <div className="flex items-center gap-3">
              <div
                className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-primary/20"
                style={{
                  backgroundImage:
                    'url("https://lh3.googleusercontent.com/aida-public/AB6AXuCCJN-3dNXsu_M9FhtvjnpESEi2vPsycOV_iEL1yIi_2Ky-NsH-w8YDr6QSgZrJh4qGNtXme33eN3Wp3Eup5o54_HL_oPXP1-8QIjt2PBEQr2oWrSfo7aYdAFc8I3O7rZXY_ucisDacJYCtG5P_X4cDgxeKAETPu_ujRJe__XoAJFK5MJISUDEuWhqPMbQKm_ZFRZhOCVOK4zf4zfPY5AIbVg52Op8oX7nn1kqEbsKKzrGQMUWrmiKPSMou3XQHR5VZAWCZQc4VxXuw")',
                }}
              />
              <div className="flex-1">
                <p className="text-[#1b0d0d] font-semibold">María García</p>
                <p className="text-xs text-gray-500">DNI 40.123.456</p>
                <p className="text-xs text-gray-500 mt-1">
                  Solicita profesor: <span className="font-semibold">Juan Díaz</span>
                </p>
              </div>
            </div>
            <div className="mt-4 flex gap-2">
              <button className="flex-1 h-11 rounded-lg border border-primary text-primary font-semibold">
                Rechazar
              </button>
              <button className="flex-1 h-11 rounded-lg bg-primary text-white font-semibold">
                Aceptar
              </button>
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 border border-gray-100 shadow-sm">
            <div className="flex items-center gap-3">
              <div
                className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-primary/20"
                style={{
                  backgroundImage:
                    'url("https://lh3.googleusercontent.com/aida-public/AB6AXuBblKe7qWWOgvopNeWfxRQwfCvcDHCLHn29_GmgFKoMbYsOk81tQX8ghGJdIAGKjdbpPVe4xmt3EjC7sv7pxGJyY9dH3AH8dvr440SW8p_-FRuqPpZrXnKLtVNSQ3xezNEXq0u2W3vgJcpLXrs6A1-K_xrV6fO--8WCV7U7OEWulLTicsHrexMPcdmV6kdORTA_a2BjMeswgMzi80PSiixczR-irqo0CLVg5c5n7bQUPlAtmm-oVErrtJGTLNyVq5sxTQSeVMg_5IWA")',
                }}
              />
              <div className="flex-1">
                <p className="text-[#1b0d0d] font-semibold">Carlos Ruiz</p>
                <p className="text-xs text-gray-500">DNI 38.902.115</p>
                <p className="text-xs text-gray-500 mt-1">
                  Invitación enviada por: <span className="font-semibold">Prof. Ana</span>
                </p>
              </div>
            </div>
            <div className="mt-4 flex gap-2">
              <button className="flex-1 h-11 rounded-lg border border-primary text-primary font-semibold">
                Rechazar
              </button>
              <button className="flex-1 h-11 rounded-lg bg-primary text-white font-semibold">
                Aceptar
              </button>
            </div>
          </div>
        </section>
      </main>
    </div>
  );
}
