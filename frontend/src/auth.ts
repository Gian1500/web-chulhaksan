export type UserRole = 'STUDENT' | 'TEACHER' | 'ADMIN';

export type AuthProfile = {
  sub: string;
  dni: string;
  role: UserRole;
};

const TOKEN_KEY = 'chulhaksan_token';
const PROFILE_KEY = 'chulhaksan_profile';

export const apiBaseUrl =
  import.meta.env.VITE_API_URL ?? 'http://localhost:3000';
const NGROK_HEADER = 'ngrok-skip-browser-warning';

export function getApiHeaders(options?: {
  token?: string;
  json?: boolean;
}) {
  const headers: Record<string, string> = {};
  if (options?.token) {
    headers.Authorization = `Bearer ${options.token}`;
  }
  if (options?.json) {
    headers['Content-Type'] = 'application/json';
  }
  if (
    apiBaseUrl.includes('ngrok-free.app') ||
    apiBaseUrl.includes('ngrok-free.dev') ||
    apiBaseUrl.includes('ngrok.io')
  ) {
    headers[NGROK_HEADER] = 'true';
  }
  return headers;
}

export function getToken() {
  return localStorage.getItem(TOKEN_KEY);
}

export function setToken(token: string) {
  localStorage.setItem(TOKEN_KEY, token);
}

export function clearAuth() {
  localStorage.removeItem(TOKEN_KEY);
  localStorage.removeItem(PROFILE_KEY);
}

export function getProfile(): AuthProfile | null {
  const raw = localStorage.getItem(PROFILE_KEY);
  if (!raw) return null;
  try {
    return JSON.parse(raw) as AuthProfile;
  } catch {
    return null;
  }
}

export function setProfile(profile: AuthProfile) {
  localStorage.setItem(PROFILE_KEY, JSON.stringify(profile));
}

export async function login(dni: string, password: string) {
  const response = await fetch(`${apiBaseUrl}/auth/login`, {
    method: 'POST',
    headers: getApiHeaders({ json: true }),
    body: JSON.stringify({ dni, password }),
  });

  if (!response.ok) {
    const errorBody = await response.json().catch(() => ({}));
    throw new Error(errorBody.message ?? 'Credenciales inválidas.');
  }

  const data = (await response.json()) as { accessToken: string };
  if (!data?.accessToken) {
    throw new Error('Respuesta inválida del servidor.');
  }
  setToken(data.accessToken);
  return data.accessToken;
}

export async function fetchMe(token: string) {
  const response = await fetch(`${apiBaseUrl}/auth/me`, {
    method: 'GET',
    headers: getApiHeaders({ token }),
  });

  if (!response.ok) {
    const errorBody = await response.json().catch(() => ({}));
    throw new Error(errorBody.message ?? 'No se pudo cargar el perfil.');
  }

  const profile = (await response.json()) as AuthProfile;
  if (!profile?.role) {
    throw new Error('Perfil inválido.');
  }
  setProfile(profile);
  return profile;
}
