import { Link } from 'react-router-dom';

export function Payments() {
  return (
    <div className="min-h-screen bg-background-light text-[#1b0d0d]">
      <header className="sticky top-0 z-50 bg-background-light/80 backdrop-blur-md border-b border-gray-200">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center rounded-full hover:bg-gray-100 transition-colors"
            to="/dashboard"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h1 className="text-lg font-bold leading-tight tracking-tight flex-1 text-center pr-10">
            Mis Pagos y Cuotas
          </h1>
        </div>
      </header>

      <main className="max-w-md mx-auto pb-24">
        <section className="p-4">
          <div className="bg-white rounded-xl p-5 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] flex items-center gap-4">
            <div className="relative">
              <div
                className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-20 w-20 border-2 border-primary"
                style={{
                  backgroundImage:
                    'url("https://lh3.googleusercontent.com/aida-public/AB6AXuAos5xQbdG0hopRVsTPpirAP0KbSkbwXsF01UGAMj1noMqHm6Vc45_Nq1nXZoQluBpRJRM_3x6J5l3qIiIjj4Kz3hzlnnggc9D3YIpjUGVE82iENCBnwKb_uutYZCpfaEnXcfE-HETPtNWEVy14tzaeDMlXVUtRSyIrkNZMZ6bQegcqEfUuRuhZ_WiJ4u3O6SFgkXkWoAPvIc9jlG0Gm0GkYpSVx-oIviQtjbdgYUF2JMkK9WdFcyjg7hr7ZKMnXz22eTiTHhatuixZ")',
                }}
              />
              <div className="absolute -bottom-1 -right-1 bg-primary text-white text-[10px] px-2 py-0.5 rounded-full font-bold uppercase">
                1er Dan
              </div>
            </div>
            <div className="flex flex-col justify-center">
              <p className="text-xl font-bold leading-tight">Juan Pérez</p>
              <p className="text-gray-600 text-sm font-medium">
                Cinturón Negro
              </p>
              <div className="mt-2 flex items-center gap-1.5">
                <span className="size-2 rounded-full bg-orange-500 animate-pulse" />
                <p className="text-orange-600 text-xs font-semibold">
                  1 Cuota Pendiente
                </p>
              </div>
            </div>
          </div>
        </section>

        <div className="px-4 flex justify-between items-end">
          <h3 className="text-lg font-bold leading-tight">Cuotas 2024</h3>
          <span className="text-xs text-gray-500 font-medium">Ciclo Actual</span>
        </div>

        <div className="mt-4 px-4 space-y-4">
          <div className="bg-white rounded-xl p-4 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] border-l-4 border-green-500">
            <div className="flex items-center justify-between mb-2">
              <div className="flex items-center gap-3">
                <div className="text-green-600 bg-green-100 flex items-center justify-center rounded-lg shrink-0 size-10">
                  <span className="material-symbols-outlined">check_circle</span>
                </div>
                <div>
                  <p className="text-base font-semibold">Junio 2024</p>
                  <p className="text-xs text-gray-500">Pagado el 05/06/2024</p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-base font-bold">$7.500</p>
                <span className="text-[10px] uppercase font-bold text-green-600 tracking-wider">
                  Acreditado
                </span>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] border-l-4 border-primary">
            <div className="flex items-center justify-between mb-4">
              <div className="flex items-center gap-3">
                <div className="text-primary bg-primary/10 flex items-center justify-center rounded-lg shrink-0 size-10">
                  <span className="material-symbols-outlined">schedule</span>
                </div>
                <div>
                  <p className="text-base font-semibold">Julio 2024</p>
                  <p className="text-xs text-primary font-medium">
                    Venció el 10/07/2024
                  </p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-base font-bold">$7.500</p>
                <span className="text-[10px] uppercase font-bold text-primary tracking-wider">
                  Pendiente
                </span>
              </div>
            </div>
            <div className="flex flex-col gap-2 pt-2 border-t border-gray-100">
              <Link
                className="w-full bg-primary text-white py-2.5 rounded-lg font-semibold text-sm flex items-center justify-center gap-2 active:scale-[0.98] transition-transform"
                to="/pagos/exito"
              >
                <span className="material-symbols-outlined text-lg">
                  payments
                </span>
                Pagar con Mercado Pago
              </Link>
              <Link
                className="w-full bg-white border border-primary text-primary py-2.5 rounded-lg font-semibold text-sm flex items-center justify-center gap-2 active:scale-[0.98] transition-transform"
                to="/pagos/qr"
              >
                <span className="material-symbols-outlined text-lg">
                  qr_code_2
                </span>
                Generar Código QR
              </Link>
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] border-l-4 border-green-500">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="text-green-600 bg-green-100 flex items-center justify-center rounded-lg shrink-0 size-10">
                  <span className="material-symbols-outlined">check_circle</span>
                </div>
                <div>
                  <p className="text-base font-semibold">Mayo 2024</p>
                  <p className="text-xs text-gray-500">Pagado el 02/05/2024</p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-base font-bold">$7.500</p>
              </div>
            </div>
          </div>

          <div className="bg-white rounded-xl p-4 shadow-[0_4px_6px_-1px_rgba(0,0,0,0.05),0_2px_4px_-1px_rgba(0,0,0,0.03)] border-l-4 border-green-500 opacity-80">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="text-green-600 bg-green-100 flex items-center justify-center rounded-lg shrink-0 size-10">
                  <span className="material-symbols-outlined">check_circle</span>
                </div>
                <div>
                  <p className="text-base font-semibold">Abril 2024</p>
                  <p className="text-xs text-gray-500">Pagado el 08/04/2024</p>
                </div>
              </div>
              <div className="text-right">
                <p className="text-base font-bold">$7.500</p>
              </div>
            </div>
          </div>
        </div>

        <section className="mt-8 px-4">
          <div className="bg-primary/5 border border-primary/20 rounded-xl p-4">
            <div className="flex gap-3">
              <span className="material-symbols-outlined text-primary">info</span>
              <div>
                <p className="text-sm font-bold text-primary">
                  Información de Cobro
                </p>
                <p className="text-xs text-gray-600 mt-1 leading-relaxed">
                  Las cuotas vencen el día 10 de cada mes. A partir del día 15
                  se aplica un recargo del 10% por mora administrativa.
                </p>
              </div>
            </div>
          </div>
        </section>
      </main>

      <nav className="fixed bottom-0 left-0 right-0 bg-white/90 backdrop-blur-lg border-t border-gray-200 pb-6 pt-2">
        <div className="max-w-md mx-auto flex justify-around items-center">
          <Link className="flex flex-col items-center gap-1 text-gray-400" to="/">
            <span className="material-symbols-outlined">home</span>
            <span className="text-[10px] font-medium">Inicio</span>
          </Link>
          <button className="flex flex-col items-center gap-1 text-primary" type="button">
            <span
              className="material-symbols-outlined"
              style={{ fontVariationSettings: '"FILL" 1' }}
            >
              account_balance_wallet
            </span>
            <span className="text-[10px] font-bold">Pagos</span>
          </button>
          <Link
            className="flex flex-col items-center gap-1 text-gray-400"
            to="/pagos/qr"
          >
            <span className="material-symbols-outlined">qr_code_2</span>
            <span className="text-[10px] font-medium">QR</span>
          </Link>
          <Link
            className="flex flex-col items-center gap-1 text-gray-400"
            to="/perfil"
          >
            <span className="material-symbols-outlined">person</span>
            <span className="text-[10px] font-medium">Perfil</span>
          </Link>
        </div>
      </nav>
    </div>
  );
}
