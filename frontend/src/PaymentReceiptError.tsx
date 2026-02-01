import { Link } from 'react-router-dom';

export function PaymentReceiptError() {
  return (
    <div className="bg-background-light min-h-screen flex flex-col items-center">
      <div className="w-full max-w-[430px] sm:max-w-[560px] md:max-w-[720px] min-h-screen flex flex-col shadow-2xl bg-white overflow-hidden">
        <div className="flex items-center bg-white p-4 pb-2 justify-between sticky top-0 z-10">
          <Link
            className="text-neutral-900 flex size-12 shrink-0 items-center cursor-pointer"
            to="/pagos"
          >
            <span className="material-symbols-outlined text-2xl">
              arrow_back_ios
            </span>
          </Link>
          <h2 className="text-neutral-900 text-lg font-bold leading-tight tracking-[-0.015em] flex-1 text-center pr-12">
            Estado del Pago
          </h2>
        </div>

        <div className="flex flex-col items-center pt-8 pb-4">
          <div className="bg-red-50 p-6 rounded-full mb-4">
            <span className="material-symbols-outlined text-primary text-6xl font-bold">
              cancel
            </span>
          </div>
          <h2 className="text-neutral-900 tracking-light text-[28px] font-bold leading-tight px-4 text-center">
            ¡Pago Fallido!
          </h2>
          <p className="text-neutral-500 text-base font-normal leading-normal px-4 text-center mt-2">
            Hubo un error al procesar tu transacción
          </p>
        </div>

        <div className="px-6 py-4">
          <div className="bg-white rounded-xl shadow-sm border border-neutral-200 overflow-hidden relative">
            <div className="h-2 bg-primary w-full"></div>
            <div className="p-6">
              <div className="text-center mb-6 pb-6 border-b border-dashed border-neutral-200">
                <p className="text-neutral-500 text-xs uppercase tracking-widest font-semibold mb-1">
                  Monto a Pagar
                </p>
                <h1 className="text-neutral-900 text-4xl font-bold">$45.000</h1>
              </div>
              <div className="space-y-4">
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">
                    Estudiante
                  </p>
                  <p className="text-neutral-900 text-sm font-semibold text-right">
                    Juan Pérez
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">DNI</p>
                  <p className="text-neutral-900 text-sm font-semibold text-right">
                    12.345.678
                  </p>
                </div>
                <div className="flex justify-between items-center gap-x-6">
                  <p className="text-neutral-500 text-sm font-medium">Mes</p>
                  <p className="text-neutral-900 text-sm font-semibold text-right">
                    Junio 2024
                  </p>
                </div>
                <div className="mt-4 p-4 bg-red-50 rounded-lg border border-red-100">
                  <p className="text-red-600 text-xs uppercase tracking-wider font-bold mb-1">
                    Motivo del Error
                  </p>
                  <p className="text-red-800 text-sm font-medium">
                    Transacción rechazada por el banco emisor. Por favor,
                    verifica los fondos o contacta a tu entidad financiera.
                  </p>
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

        <div className="px-6 py-8 flex flex-col gap-3 mt-4">
          <Link
            className="w-full bg-primary hover:bg-red-600 text-white font-bold py-4 rounded-xl flex items-center justify-center gap-2 transition-colors shadow-lg shadow-red-500/20"
            to="/pagos"
          >
            <span className="material-symbols-outlined">refresh</span>
            Reintentar Pago
          </Link>
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
