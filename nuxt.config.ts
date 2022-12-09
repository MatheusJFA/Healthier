// https://nuxt.com/docs/api/configuration/nuxt-config
export default defineNuxtConfig({
  typescript: {
    shim: false
  },
  nitro: {
    preset: 'vercel-edge',
  },
  modules: [
    'nuxt-icon',
    [
      '@pinia/nuxt',
      {
        autoImports: ['defineStore'],
      }
    ]

  ],
  css: ['~/assets/css/main.css'],
  postcss: {
    plugins: {
      tailwindcss: {},
      autoprefixer: {},
    },
  },
  alias: {
    pinia: '/node_modules/@pinia/nuxt/node_modules/pinia/dist/pinia.mjs',
  },
})
