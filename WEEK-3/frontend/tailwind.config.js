/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./src/**/*.{js,jsx,ts,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        'glass-1': 'rgba(255,255,255,0.06)',
        'glass-2': 'rgba(255,255,255,0.04)',
      },
      fontFamily: {
        display: ['"Inter"', 'system-ui', 'sans-serif'],
        body: ['"Inter"', 'system-ui', 'sans-serif'],
      },
      backgroundImage: {
        'futuristic': 'linear-gradient(135deg, #0f172a 0%, #001219 40%, #04283a 100%)',
        'accent-grad': 'linear-gradient(90deg, #7c3aed 0%, #06b6d4 100%)',
      }
    },
  },
  plugins: [],
}
