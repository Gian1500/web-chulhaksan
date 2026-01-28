# AGENTS.md

## Project snapshot
- Repo layout: `backend/` (NestJS + Prisma + PostgreSQL), `frontend/` (React + Vite + TypeScript + Tailwind).
- App domain: escuela/academia con roles `ADMIN`, `TEACHER`, `STUDENT`.
- Core flows: auth con JWT, asignacion de alumnos a profesor, cuotas mensuales, pagos Mercado Pago y pagos en efectivo.

## Quick commands
- Frontend dev: `cd frontend; npm install; npm run dev`
- Backend dev: `cd backend; npm install; npm run start:dev`
- Prisma: `cd backend; npx prisma generate`; `npx prisma migrate dev`
- Tests (backend): `cd backend; npm run test` / `npm run test:e2e`

## Runtime/config notes
- Backend carga `.env` desde `backend/.env` y/o raiz.
- MP OAuth: `MP_CLIENT_ID`, `MP_CLIENT_SECRET`, `MP_OAUTH_REDIRECT_URI`, `MP_OAUTH_STATE_SECRET`.
- MP Webhook: `MP_WEBHOOK_URL` (se usa con `teacherId` en query).
- MP Back URLs: `MP_BACK_URL_SUCCESS`, `MP_BACK_URL_FAILURE`, `MP_BACK_URL_PENDING`.
- DB: `DATABASE_URL` (PostgreSQL).

## Key business rules
- DNI debe ser numerico sin puntos; normalizar a solo digitos en backend.
- Alumnos solo ven nombre/apellido del profesor asignado.
- Profesores pueden crear alumnos y quedan `ACTIVE` y asignados al profesor.
- Cuotas se generan automaticamente el dia 1 y vencen el dia 10.
- Recargo fijo de 5000 desde el dia 11 (no acumulativo).
- Profesores solo pueden ver/alinear alumnos no asignados; no pueden reasignar alumnos de otros profesores.
- Profesores pueden marcar cuota como pagada en efectivo (genera `Payment` aprobado).
- Asistencia/solicitudes estan ocultas en frontend (endpoints quedan para futuro).

## Data model hints (Prisma)
- `User` con `role` y `status`.
- `Student` incluye `guardianPhone` y `gym`.
- `Teacher` incluye tokens OAuth de Mercado Pago.
- `StudentTeacherAssignment` define asignacion activa.
- `MonthlyFee` y `Payment` manejan cuotas/pagos.

## Frontend touchpoints
- Auth helpers: `frontend/src/auth.ts`
- Dashboard: `frontend/src/Dashboard.tsx`
- Alumnos profesor: `frontend/src/TeacherStudents.tsx`
- Detalle alumno + cuotas: `frontend/src/StudentDetail.tsx`
- Pagos alumno: `frontend/src/Payments.tsx`, `frontend/src/PaymentQr.tsx`
- Home: `frontend/src/Home.tsx`

## Backend touchpoints
- Auth: `backend/src/auth/*`
- Profesores: `backend/src/teachers/*`
- Alumnos: `backend/src/students/*`
- Asignaciones: `backend/src/assignments/*`
- Cuotas: `backend/src/fees/*`
- Pagos: `backend/src/payments/*`
- Prisma schema: `backend/prisma/schema.prisma`

## Agent guidelines (project-specific)
- Mantener validaciones de DNI numerico en frontend y backend.
- No exponer datos del profesor a alumnos salvo nombre/apellido.
- Evitar cambios en endpoints de asistencia/solicitudes hasta nuevo requerimiento.
- Si agregas campos a Prisma, actualizar DTOs, servicios y UI.
- Respetar estilo UI actual (Tailwind, componentes mobile-first).
