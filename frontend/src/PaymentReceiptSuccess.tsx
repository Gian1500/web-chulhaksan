import { Link } from 'react-router-dom';

export function PaymentReceiptSuccess() {
  return (
    <div className="bg-background-light min-h-screen flex flex-col items-center">
      <div className="w-full max-w-[430px] min-h-screen flex flex-col shadow-2xl bg-background-light overflow-hidden">
        <div className="flex items-center bg-background-light p-4 pb-2 justify-between sticky top-0 z-10">
          <Link
            className="text-background-dark flex size-12 shrink-0 items-center cursor-pointer"
            to="/pagos"
          >
            <span className="material-symbols-outlined text-2xl">
              arrow_back_ios
            </span>
          </Link>
          <h2 className="text-background-dark text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center pr-12">
            Comprobante de Pago
          </h2>
        </div>

        <div className="flex flex-col items-center pt-8 pb-4">
          <div className="bg-primary/20 p-6 rounded-full mb-4">
            <span className="material-symbols-outlined text-primary text-6xl font-bold">
              check_circle
            </span>
          </div>
          <h2 className="text-background-dark tracking-light text-[28px] font-bold leading-tight px-4 text-center">
            ¡Pago Exitoso!
          </h2>
          <p className="text-background-dark/70 text-base font-normal leading-normal px-4 text-center mt-2">
            Tu pago ha sido procesado correctamente
          </p>
        </div>

        <div className="px-6 py-4">
          <div className="bg-white rounded-xl shadow-sm border border-neutral-200 overflow-hidden relative">
            <div className="h-2 bg-primary w-full"></div>
            <div className="p-6">
              <div className="text-center mb-6 pb-6 border-b border-dashed border-neutral-200">
                <p className="text-neutral-500 text-xs uppercase tracking-widest font-semibold mb-1">
                  Monto Pagado
                </p>
                <h1 className="text-background-dark text-4xl font-bold">
                  $45.000
                </h1>
              </div>
              <div className="space-y-4">
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Estudiante
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    Juan Pérez
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">DNI</p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    12.345.678
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Mes Pagado
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    Junio 2024
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6 pt-2">
                  <p className="text-neutral-500 text-sm font-medium">
                    ID de Transacción
                  </p>
                  <p className="text-background-dark text-sm font-mono text-right">
                    #TKD-99283
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Fecha y Hora
                  </p>
                  <p className="text-background-dark text-sm font-semibold text-right">
                    24/05/2024 14:30
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">Método</p>
                  <div className="flex items-center gap-2">
                    <span className="material-symbols-outlined text-base text-neutral-400">
                      credit_card
                    </span>
                    <p className="text-background-dark text-sm font-semibold text-right">
                      VISA •••• 4242
                    </p>
                  </div>
                </div>
              </div>
            </div>
            <div className="absolute -bottom-1.5 left-0 right-0 flex justify-around px-2">
              {Array.from({ length: 8 }).map((_, index) => (
                <div
                  key={index}
                  className="h-3 w-3 rounded-full bg-background-light"
                ></div>
              ))}
            </div>
          </div>
        </div>

        <div className="px-6 py-8 flex flex-col gap-3">
          <button
            className="w-full bg-primary hover:bg-primary/90 text-background-dark font-bold py-4 rounded-xl flex items-center justify-center gap-2 transition-colors"
            type="button"
          >
            <span className="material-symbols-outlined">download</span>
            Descargar Comprobante (PDF)
          </button>
          <Link
            className="w-full bg-transparent hover:bg-neutral-100 text-neutral-600 font-semibold py-4 rounded-xl flex items-center justify-center gap-2 transition-colors"
            to="/pagos"
          >
            Volver a Pagos
          </Link>
        </div>
        <div className="mt-auto h-8"></div>
      </div>
    </div>
  );
}
