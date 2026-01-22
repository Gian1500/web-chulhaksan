import { Link } from 'react-router-dom';

export function Attendance() {
  return (
    <div className="bg-background-light min-h-screen flex flex-col checkbox-custom">
      <header className="sticky top-0 z-20 bg-background-light/80 backdrop-blur-md border-b border-[#e7cfcf]">
        <div className="flex items-center p-4 justify-between max-w-md mx-auto">
          <Link
            className="text-[#1b0d0d] flex size-10 shrink-0 items-center justify-center"
            to="/profesor/alumnos"
          >
            <span className="material-symbols-outlined">arrow_back_ios</span>
          </Link>
          <h2 className="text-[#1b0d0d] text-lg font-bold leading-tight tracking-tight flex-1 text-center">
            Toma de Asistencia
          </h2>
          <div className="flex w-10 items-center justify-end">
            <button className="text-[#1b0d0d]">
              <span className="material-symbols-outlined">more_horiz</span>
            </button>
          </div>
        </div>
      </header>

      <main className="flex-1 max-w-md mx-auto w-full pb-32">
        <section className="p-4">
          <div className="flex flex-col gap-0.5 bg-white p-4 rounded-xl shadow-sm border border-[#e7cfcf]">
            <div className="flex items-center p-1 justify-between mb-2">
              <button className="text-[#1b0d0d] flex size-10 items-center justify-center hover:bg-gray-100 rounded-full">
                <span className="material-symbols-outlined">chevron_left</span>
              </button>
              <p className="text-[#1b0d0d] text-base font-bold leading-tight flex-1 text-center">
                Octubre 2023
              </p>
              <button className="text-[#1b0d0d] flex size-10 items-center justify-center hover:bg-gray-100 rounded-full">
                <span className="material-symbols-outlined">chevron_right</span>
              </button>
            </div>
            <div className="grid grid-cols-7 text-center">
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">D</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">L</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">M</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">M</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">J</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">V</p>
              <p className="text-[#9a4c4c] text-[13px] font-bold py-2">S</p>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium col-start-2">
                <div className="flex size-full items-center justify-center rounded-full">
                  1
                </div>
              </button>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full">
                  2
                </div>
              </button>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full">
                  3
                </div>
              </button>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full">
                  4
                </div>
              </button>
              <button className="h-10 text-white text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full bg-primary">
                  5
                </div>
              </button>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full">
                  6
                </div>
              </button>
              <button className="h-10 text-[#1b0d0d] text-sm font-medium">
                <div className="flex size-full items-center justify-center rounded-full">
                  7
                </div>
              </button>
            </div>
          </div>
        </section>

        <section className="px-4 py-2">
          <div className="flex items-center gap-2 mb-4">
            <div className="flex-1">
              <label className="flex flex-col min-w-40 h-11 w-full">
                <div className="flex w-full flex-1 items-stretch rounded-lg h-full">
                  <div className="text-[#9a4c4c] flex border-none bg-white items-center justify-center pl-4 rounded-l-lg border-r-0">
                    <span className="material-symbols-outlined">search</span>
                  </div>
                  <input
                    className="form-input flex w-full min-w-0 flex-1 resize-none overflow-hidden rounded-lg text-[#1b0d0d] focus:outline-0 focus:ring-0 border-none bg-white focus:border-none h-full placeholder:text-[#9a4c4c] px-4 rounded-l-none border-l-0 pl-2 text-base font-normal leading-normal"
                    placeholder="Buscar estudiante..."
                    readOnly
                  />
                </div>
              </label>
            </div>
            <button className="bg-white p-2.5 rounded-lg border border-[#e7cfcf] text-[#9a4c4c]">
              <span className="material-symbols-outlined">filter_list</span>
            </button>
          </div>
          <div className="flex items-center justify-between px-2 mb-2">
            <p className="text-[#9a4c4c] text-sm font-semibold uppercase tracking-wider">
              Estudiantes (24)
            </p>
            <button className="text-primary text-sm font-bold flex items-center gap-1">
              Marcar todos
              <span className="material-symbols-outlined text-sm">done_all</span>
            </button>
          </div>
          <div className="space-y-2">
            <div className="flex items-center gap-4 bg-white px-4 min-h-[72px] py-3 justify-between rounded-xl shadow-sm border border-[#e7cfcf]">
              <div className="flex items-center gap-4">
                <div
                  className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-gray-200"
                  style={{
                    backgroundImage:
                      'url("https://lh3.googleusercontent.com/aida-public/AB6AXuDWty76--705yT24M48_A_ZBjH-8h70y_Qm_zVlqpOVu9U5kGmSkphSFaODPCWWpdlP67kcxR7UxDHBGsLOBAIAJFZYAtY4qi1r7RKfx_HT25-t1Mq5XtLg_iHu0o4EMWuUeYTwMo5_JIqy4NKcZoPUYxGX9MRRveahm5ml55J6SVjE-A5sT4Dg7QaHmIqbUqRy3URbikhL4VenB1tMFhXerkXCSmWxuJ3xqehbERvmiTZ5RvSvxYpzd3-6leuIt9CyBaQN_8zZd6FP")',
                  }}
                />
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-normal line-clamp-1">
                    Mateo García
                  </p>
                  <div className="flex items-center gap-1.5">
                    <div className="w-3 h-3 rounded-full bg-white border border-gray-300"></div>
                    <p className="text-[#9a4c4c] text-xs font-normal leading-normal line-clamp-1">
                      Cinturón Blanco
                    </p>
                  </div>
                </div>
              </div>
              <div className="shrink-0">
                <div className="flex size-8 items-center justify-center">
                  <input
                    checked
                    className="h-6 w-6 rounded border-[#e7cfcf] border-2 bg-transparent text-primary checked:bg-primary checked:border-primary checked:bg-[image:--checkbox-tick-svg] focus:ring-0 focus:ring-offset-0 transition-all cursor-pointer"
                    type="checkbox"
                    readOnly
                  />
                </div>
              </div>
            </div>
            <div className="flex items-center gap-4 bg-white px-4 min-h-[72px] py-3 justify-between rounded-xl shadow-sm border border-[#e7cfcf]">
              <div className="flex items-center gap-4">
                <div
                  className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-yellow-400"
                  style={{
                    backgroundImage:
                      'url("https://lh3.googleusercontent.com/aida-public/AB6AXuB6UooFRMU5pXrrI1FoajASFJhgA7uz1y-icrT9MQAtEIyqJLjlR7QR-Gts6YG5poWoXYcnhhI8CeEu0fBcBnBGLkhmS_HeF6R5ak_9DXW4i1iq_xUlflmqUy8y5b-FU7UydTnAHTpi75BabPVz0nMjcZCD3L46YddDaA4OT5G6bVekVJ4bIpBscPdyloNCLM5CqCC0xwTe82D3CfUhgG2YqL6aJ7FqtYKy1hXdU_j5TKdYJOIwYnfm7LV20X-0XKZ1eOhnKM8Ch-tQ")',
                  }}
                />
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-normal line-clamp-1">
                    Sofía Rodríguez
                  </p>
                  <div className="flex items-center gap-1.5">
                    <div className="w-3 h-3 rounded-full bg-yellow-400"></div>
                    <p className="text-[#9a4c4c] text-xs font-normal leading-normal line-clamp-1">
                      Cinturón Amarillo
                    </p>
                  </div>
                </div>
              </div>
              <div className="shrink-0">
                <div className="flex size-8 items-center justify-center">
                  <input
                    className="h-6 w-6 rounded border-[#e7cfcf] border-2 bg-transparent text-primary checked:bg-primary checked:border-primary checked:bg-[image:--checkbox-tick-svg] focus:ring-0 focus:ring-offset-0 transition-all cursor-pointer"
                    type="checkbox"
                    readOnly
                  />
                </div>
              </div>
            </div>
            <div className="flex items-center gap-4 bg-white px-4 min-h-[72px] py-3 justify-between rounded-xl shadow-sm border border-[#e7cfcf]">
              <div className="flex items-center gap-4">
                <div
                  className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-blue-500"
                  style={{
                    backgroundImage:
                      'url("https://lh3.googleusercontent.com/aida-public/AB6AXuA25zy8YMmQjKG-R_08Krq26100oSAJAxQud0DhmpRYiLQ1Cl7SdUgklvwzA0SSHs7xGyq-QZovsFZJTZeUV_0EMHG3VyMJjfwfeeMV2Vlq6epbO2VfRKr9tC504cZvs-elNX6ow6In3Ut_Y0DEyGT3V_KyX8O-bbF9RB0Z7k72rhjc61fZh23Y8-C89tnEYhXdzV9ESkmaTlW1oaMW4TVc3dKCHBLbR9T0pihWxNf10aiLq7vBjjDXlS36Z8dEL9lgxUMf03j0XCdt")',
                  }}
                />
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-normal line-clamp-1">
                    Lucas Martínez
                  </p>
                  <div className="flex items-center gap-1.5">
                    <div className="w-3 h-3 rounded-full bg-blue-500"></div>
                    <p className="text-[#9a4c4c] text-xs font-normal leading-normal line-clamp-1">
                      Cinturón Azul
                    </p>
                  </div>
                </div>
              </div>
              <div className="shrink-0">
                <div className="flex size-8 items-center justify-center">
                  <input
                    checked
                    className="h-6 w-6 rounded border-[#e7cfcf] border-2 bg-transparent text-primary checked:bg-primary checked:border-primary checked:bg-[image:--checkbox-tick-svg] focus:ring-0 focus:ring-offset-0 transition-all cursor-pointer"
                    type="checkbox"
                    readOnly
                  />
                </div>
              </div>
            </div>
            <div className="flex items-center gap-4 bg-white px-4 min-h-[72px] py-3 justify-between rounded-xl shadow-sm border border-[#e7cfcf]">
              <div className="flex items-center gap-4">
                <div
                  className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-red-500"
                  style={{
                    backgroundImage:
                      'url("https://lh3.googleusercontent.com/aida-public/AB6AXuBcWk3tRvbSc8jBFe3AIywcnbAODFCJRmXfrlVgVbgEt6_v2SMMu5xTSVvUGYahRhoKgAS05OTvecO40xo2RpXRC5BbzCwSQLMqLp0On9CqRpNnqr8Md3pbonsdXq5B98riciVqPxuRm8ycKdWFQOMDBcN_kt3JEW43De76kJBObaXsJinTnivU_R8EMqysi7Ww-s4MSUIKX_9OwhJB5R04MzanyOJZ9c1hj_XRdW_Ogr_WTU4NcznvMchMB_dLMMB7_Zdwusypg-Mv")',
                  }}
                />
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-normal line-clamp-1">
                    Elena Ruiz
                  </p>
                  <div className="flex items-center gap-1.5">
                    <div className="w-3 h-3 rounded-full bg-red-600"></div>
                    <p className="text-[#9a4c4c] text-xs font-normal leading-normal line-clamp-1">
                      Cinturón Rojo
                    </p>
                  </div>
                </div>
              </div>
              <div className="shrink-0">
                <div className="flex size-8 items-center justify-center">
                  <input
                    className="h-6 w-6 rounded border-[#e7cfcf] border-2 bg-transparent text-primary checked:bg-primary checked:border-primary checked:bg-[image:--checkbox-tick-svg] focus:ring-0 focus:ring-offset-0 transition-all cursor-pointer"
                    type="checkbox"
                    readOnly
                  />
                </div>
              </div>
            </div>
            <div className="flex items-center gap-4 bg-white px-4 min-h-[72px] py-3 justify-between rounded-xl shadow-sm border border-[#e7cfcf]">
              <div className="flex items-center gap-4">
                <div
                  className="bg-center bg-no-repeat aspect-square bg-cover rounded-full h-12 w-12 border-2 border-black"
                  style={{
                    backgroundImage:
                      'url("https://lh3.googleusercontent.com/aida-public/AB6AXuBtTCR2PyYstFzuu8USjsNRYFMati65JjZe-xC0RfgC2Hzg8yu6tc4hABbb3Ksn-BugARSj8DfcwfCSAI-G5Ag5uoR3awlyEh-dxZQO4JDVQSG4AVlFX5v1AdvIiTqXCcAfiFH06TAr_64nJbhOb4eEAt2lqDz0FKyS9XT5iMHwwnw9zUdq0d8ik5pQvNDTaw1VP93UwgXfRYbHppbC0G8lE4SDcOgOM7DkI8XEbbQvHQVO5cmKymuy6_cMj1bh97By1CW0YawNK3jR")',
                  }}
                />
                <div className="flex flex-col justify-center">
                  <p className="text-[#1b0d0d] text-base font-semibold leading-normal line-clamp-1">
                    Diego Silva
                  </p>
                  <div className="flex items-center gap-1.5">
                    <div className="w-3 h-3 rounded-full bg-black"></div>
                    <p className="text-[#9a4c4c] text-xs font-normal leading-normal line-clamp-1">
                      Cinturón Negro
                    </p>
                  </div>
                </div>
              </div>
              <div className="shrink-0">
                <div className="flex size-8 items-center justify-center">
                  <input
                    checked
                    className="h-6 w-6 rounded border-[#e7cfcf] border-2 bg-transparent text-primary checked:bg-primary checked:border-primary checked:bg-[image:--checkbox-tick-svg] focus:ring-0 focus:ring-offset-0 transition-all cursor-pointer"
                    type="checkbox"
                    readOnly
                  />
                </div>
              </div>
            </div>
          </div>
        </section>
      </main>

      <div className="fixed bottom-0 left-0 right-0 p-4 bg-background-light/95 backdrop-blur-md z-30 max-w-md mx-auto">
        <div className="mb-3 text-center">
          <p className="text-[#1b0d0d] text-sm font-medium">
            18 estudiantes presentes
          </p>
        </div>
        <button className="w-full bg-primary hover:bg-red-700 text-white font-bold py-4 rounded-xl shadow-lg transition-colors flex items-center justify-center gap-2">
          <span className="material-symbols-outlined">save</span>
          Guardar Asistencia
        </button>
      </div>
    </div>
  );
}
