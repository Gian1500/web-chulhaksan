/** @type {import('tailwindcss').Config} */
export default {
  content: ['./index.html', './src/**/*.{ts,tsx}'],
  theme: {
    extend: {
      colors: {
        primary: '#ec1313',
        accent: '#d11111',
        'background-light': '#f8f6f6',
        'background-dark': '#1a0d0d',
      },
      fontFamily: {
        display: ['Lexend', 'sans-serif'],
      },
      borderRadius: {
        DEFAULT: '0.25rem',
        lg: '0.5rem',
        xl: '0.75rem',
        '2xl': '1rem',
        full: '9999px',
      },
      boxShadow: {
        'soft-red': '0 4px 12px rgba(236, 19, 19, 0.08)',
        'brand-glow': '0 8px 30px rgba(0, 0, 0, 0.12)',
      },
    },
  },
  plugins: [require('@tailwindcss/container-queries')],
};
