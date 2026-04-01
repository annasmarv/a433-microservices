# Menggunakan base image Node.js Alpine untuk efisiensi ukuran image dan keamanan (minimal attack surface).
FROM node:18-alpine

# Menetapkan direktori kerja utama aplikasi di dalam filesystem container.
WORKDIR /app

# Menyalin manifest dependency secara terpisah untuk mengoptimalkan 'Docker Layer Caching' saat build.
COPY package*.json ./

# Mengeksekusi instalasi library yang dibutuhkan aplikasi sesuai dengan lockfile.
RUN npm install

# Menyalin seluruh kode sumber ke dalam image setelah tahap instalasi dependency selesai.
COPY . .

# Mendokumentasikan port internal yang akan digunakan oleh aplikasi (Order: 3000 / Shipping: 3001).
EXPOSE 3000

# Menjalankan aplikasi dengan 'exec form' agar container dapat menerima sinyal SIGTERM untuk graceful shutdown.
CMD ["npm", "start"]