module.exports = {
  purge: [
    '../lib/petal_web/live/**/*.ex',
    '../lib/petal_web/live/**/*.leex',
    '../lib/petal_web/templates/**/*.eex',
    '../lib/petal_web/templates/**/*.leex',
    '../lib/petal_web/views/**/*.ex',
    './js/**/*.js'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
