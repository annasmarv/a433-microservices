# Menggunakan base image Node.js versi 14 sesuai kriteria
FROM node:14

# Menentukan folder kerja di dalam container
WORKDIR /app

# Menyalin seluruh source code ke dalam folder /app di container
COPY . .

# Mengatur environment variable untuk mode produksi dan host database
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependensi produksi dan membangun aplikasi
RUN npm install --production --unsafe-perm && npm run build

# Membuka akses port 8080 untuk aplikasi
EXPOSE 8080

# Menjalankan aplikasi dengan perintah npm start saat container menyala
CMD ["npm", "start"]