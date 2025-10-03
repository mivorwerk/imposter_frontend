# Verwende offizielle Node.js 20 Alpine Image (klein und sicher)
FROM node:20-alpine

# Setze Arbeitsverzeichnis im Container
WORKDIR /app

# Kopiere package*.json Dateien zuerst (für bessere Docker Layer-Caching)
COPY package*.json ./

# Installiere Dependencies
RUN npm install

# Kopiere den Rest des Codes
COPY . .

# Exponiere Port 5173 (Standard Vite Port)
EXPOSE 5173

# Starte den Entwicklungsserver
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]