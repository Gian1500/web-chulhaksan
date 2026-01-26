import { BrowserRouter, Route, Routes } from 'react-router-dom';
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

export function App() {
  return (
    <BrowserRouter>
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/login" element={<Login />} />
        <Route path="/pagos" element={<Payments />} />
        <Route path="/pagos/qr" element={<PaymentQr />} />
        <Route path="/alumno/:dni" element={<StudentDetail />} />
        <Route path="/profesor/alumnos" element={<TeacherStudents />} />
        <Route path="/pagos/exito" element={<PaymentReceiptSuccess />} />
        <Route path="/pagos/error" element={<PaymentReceiptError />} />
        <Route path="/perfil" element={<StudentProfile />} />
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/recuperar" element={<ForgotPassword />} />
        <Route path="/recuperar/enviado" element={<ForgotPasswordSuccess />} />
      </Routes>
    </BrowserRouter>
  );
}
