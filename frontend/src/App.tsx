import { BrowserRouter, Navigate, Route, Routes, useLocation } from 'react-router-dom';
import { Home } from './Home';
import { Login } from './Login';
import { Payments } from './Payments';
import { PaymentQr } from './PaymentQr';
import { StudentDetail } from './StudentDetail';
import { TeacherStudents } from './TeacherStudents';
import { PaymentReceiptSuccess } from './PaymentReceiptSuccess';
import { PaymentReceiptError } from './PaymentReceiptError';
import { StudentProfile } from './StudentProfile';
import { Dashboard } from './Dashboard';
import { ForgotPassword } from './ForgotPassword';
import { ForgotPasswordSuccess } from './ForgotPasswordSuccess';
import { AdminStudents } from './AdminStudents';
import { AdminTeachers } from './AdminTeachers';
import { ChangePassword } from './ChangePassword';
import { getProfile } from './auth';
import { AdminGyms } from './AdminGyms';
import { TeacherGyms } from './TeacherGyms';
import { GymAttendance } from './GymAttendance';
import { MyAttendance } from './MyAttendance';
import { FormsManager } from './FormsManager';
import { MyForms } from './MyForms';

function AdminRoute({ children }: { children: JSX.Element }) {
  const profile = getProfile();
  if (!profile) {
    return <Navigate to="/login" replace />;
  }
  if (profile.role !== 'ADMIN') {
    return <Navigate to="/dashboard" replace />;
  }
  return children;
}

function TeacherRoute({ children }: { children: JSX.Element }) {
  const profile = getProfile();
  if (!profile) {
    return <Navigate to="/login" replace />;
  }
  if (profile.role !== 'TEACHER') {
    return <Navigate to="/dashboard" replace />;
  }
  return children;
}

function StudentRoute({ children }: { children: JSX.Element }) {
  const profile = getProfile();
  if (!profile) {
    return <Navigate to="/login" replace />;
  }
  if (profile.role !== 'STUDENT') {
    return <Navigate to="/dashboard" replace />;
  }
  return children;
}

function PasswordGate({ children }: { children: JSX.Element }) {
  const profile = getProfile();
  const location = useLocation();
  if (
    profile?.mustChangePassword &&
    location.pathname !== '/cambiar-contrasena'
  ) {
    return <Navigate to="/cambiar-contrasena" replace />;
  }
  return children;
}

export function App() {
  return (
    <BrowserRouter>
      <PasswordGate>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/login" element={<Login />} />
          <Route path="/cambiar-contrasena" element={<ChangePassword />} />
          <Route path="/pagos" element={<Payments />} />
          <Route path="/pagos/qr" element={<PaymentQr />} />
          <Route path="/alumno/:dni" element={<StudentDetail />} />
          <Route path="/profesor/alumnos" element={<TeacherStudents />} />
          <Route
            path="/profesor/gimnasios/:gymId/asistencia"
            element={
              <TeacherRoute>
                <GymAttendance />
              </TeacherRoute>
            }
          />
          <Route path="/pagos/exito" element={<PaymentReceiptSuccess />} />
          <Route path="/pagos/error" element={<PaymentReceiptError />} />
          <Route path="/perfil" element={<StudentProfile />} />
          <Route
            path="/asistencia"
            element={
              <StudentRoute>
                <MyAttendance />
              </StudentRoute>
            }
          />
          <Route
            path="/formas"
            element={
              <StudentRoute>
                <MyForms />
              </StudentRoute>
            }
          />
          <Route path="/dashboard" element={<Dashboard />} />
          <Route path="/recuperar" element={<ForgotPassword />} />
          <Route path="/recuperar/enviado" element={<ForgotPasswordSuccess />} />
          <Route
            path="/admin/alumnos"
            element={
              <AdminRoute>
                <AdminStudents />
              </AdminRoute>
            }
          />
          <Route
            path="/admin/profesores"
            element={
              <AdminRoute>
                <AdminTeachers />
              </AdminRoute>
            }
          />
          <Route
            path="/admin/gimnasios"
            element={
              <AdminRoute>
                <AdminGyms />
              </AdminRoute>
            }
          />
          <Route
            path="/admin/gimnasios/:gymId/asistencia"
            element={
              <AdminRoute>
                <GymAttendance />
              </AdminRoute>
            }
          />
          <Route
            path="/admin/formas"
            element={
              <AdminRoute>
                <FormsManager />
              </AdminRoute>
            }
          />
          <Route
            path="/profesor/gimnasios"
            element={
              <TeacherRoute>
                <TeacherGyms />
              </TeacherRoute>
            }
          />
          <Route
            path="/profesor/formas"
            element={
              <TeacherRoute>
                <FormsManager />
              </TeacherRoute>
            }
          />
        </Routes>
      </PasswordGate>
    </BrowserRouter>
  );
}
