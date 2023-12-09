# Golang builder stage
FROM golang:1.20-alpine AS builder

# Çalışma dizinini oluşturuyoruz
WORKDIR /app

# Gerekli bağımlılıkları indir
RUN apk add --no-cache git

# Kopyala ve bağımlılıkları indir
COPY . .
RUN go mod download

# Air ve Delve'yi indir ve yükle
RUN go install github.com/cosmtrek/air@latest
RUN go install github.com/go-delve/delve/cmd/dlv@latest

# Uygulamayı derle ve çalıştır
CMD ["air", "-c", "/app/air.toml"]
