import { Link } from 'react-router-dom';

export function PaymentQr() {
  return (
    <div className="bg-background-light min-h-screen flex flex-col items-center justify-center p-4">
      <div className="w-full max-w-[420px] bg-white rounded-xl shadow-2xl overflow-hidden flex flex-col">
        <div className="flex items-center bg-white p-4 pb-2 justify-between border-b border-gray-100">
          <Link
            className="text-[#1b0d0d] flex size-12 shrink-0 items-center justify-start"
            to="/pagos"
          >
            <span className="material-symbols-outlined cursor-pointer">
              arrow_back_ios
            </span>
          </Link>
          <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center">
            Pago por QR
          </h2>
          <div className="flex w-12 items-center justify-end">
            <button className="flex items-center justify-center rounded-lg h-12 bg-transparent text-[#1b0d0d] gap-2 text-base font-bold leading-normal tracking-[0.015em] min-w-0 p-0">
              <span className="material-symbols-outlined">help</span>
            </button>
          </div>
        </div>

        <div className="flex flex-col items-center py-6 px-4">
          <h3 className="text-[#1b0d0d] text-2xl font-bold leading-tight text-center pb-2">
            Pago de Octubre
          </h3>
          <p className="text-[#1b0d0d]/70 text-base font-normal leading-normal pb-6 px-4 text-center">
            Escanea este código desde Mercado Pago para completar el pago de la
            cuota.
          </p>

          <div className="w-full max-w-[280px] aspect-square bg-white p-4 rounded-xl shadow-inner border-2 border-primary/20 flex items-center justify-center">
            <div
              className="w-full h-full bg-center bg-no-repeat bg-contain"
              style={{ backgroundImage: 'url("/assets/qr-placeholder.png")' }}
            />
          </div>

          <div className="mt-8 w-full">
            <div className="flex flex-col gap-2 rounded-xl p-6 bg-primary/10 border border-primary/20">
              <div className="flex items-center justify-between">
                <p className="text-[#1b0d0d] text-base font-medium leading-normal">
                  Monto Total
                </p>
                <span className="material-symbols-outlined text-primary">
                  verified_user
                </span>
              </div>
              <p className="text-primary text-4xl font-bold leading-tight">
                $45.00
              </p>
            </div>
          </div>

          <div className="mt-6 w-full px-4">
            <div className="flex gap-3 mb-4 items-start">
              <div className="bg-[#1b0d0d] text-white rounded-full size-6 flex items-center justify-center text-xs font-bold shrink-0">
                1
              </div>
              <p className="text-sm text-[#1b0d0d]/90">
                Abrí la app de Mercado Pago en tu teléfono.
              </p>
            </div>
            <div className="flex gap-3 mb-4 items-start">
              <div className="bg-[#1b0d0d] text-white rounded-full size-6 flex items-center justify-center text-xs font-bold shrink-0">
                2
              </div>
              <p className="text-sm text-[#1b0d0d]/90">
                Elegí "Escanear QR" y apunta al código.
              </p>
            </div>
            <div className="flex gap-3 items-start">
              <div className="bg-[#1b0d0d] text-white rounded-full size-6 flex items-center justify-center text-xs font-bold shrink-0">
                3
              </div>
              <p className="text-sm text-[#1b0d0d]/90">
                Confirma el monto y completa el pago.
              </p>
            </div>
          </div>

          <div className="w-full mt-10">
            <Link
              className="w-full bg-primary hover:bg-primary/90 text-white font-bold py-4 rounded-xl transition-colors shadow-lg shadow-primary/30 flex items-center justify-center"
              to="/pagos"
            >
              Volver
            </Link>
          </div>

          <div className="mt-6 flex items-center gap-2 opacity-40">
            <span className="text-[10px] font-bold tracking-widest uppercase text-[#1b0d0d]">
              Secured by
            </span>
            <div
              className="h-4 w-16 bg-contain bg-no-repeat bg-center"
              style={{ backgroundImage: 'url("/assets/mercadopago.png")' }}
            />
          </div>
        </div>
      </div>

      <div className="mt-6 flex items-center gap-2 text-[#1b0d0d]/50 text-xs">
        <span className="material-symbols-outlined text-sm">light_mode</span>
        <p>Tip: aumenta el brillo para una mejor lectura</p>
      </div>
    </div>
  );
}
