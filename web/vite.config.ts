import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

export default defineConfig({
  // Relative assets work both at the repository Pages path and in local preview.
  base: './',
  plugins: [react()],
})
