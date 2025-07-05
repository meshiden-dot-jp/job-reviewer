module.exports = {
  content: [
    "./app/views/**/*.html.erb",
    "./app/helpers/**/*.rb",
    "./app/assets/**/*.js",
  ],
  theme: {
    extend: {},
  },
  plugins: [
  require('@tailwindcss/forms'),
  ],
}

