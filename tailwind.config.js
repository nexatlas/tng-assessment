/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      colors: {
        primary: "#032250",
        primary_light: "#063f93",
        secondary: "#149dff",
        secondary_1: "#cfe9fc",
        background: "#fafafa",
        background_1: "#02132c",
      },
    },
  },
  plugins: [],
};
