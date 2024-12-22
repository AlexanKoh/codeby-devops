FROM alpine:latest

# Установка nginx
RUN apk update && apk add nginx

# Создание директории для веб-контента
RUN mkdir -p /opt/www

# Создание простого HTML файла
RUN echo "<html><body><h1>Hello from Nginx on Alpine!</h1></body></html>" > /opt/www/index.html

# Создание директории для конфигураций nginx
RUN mkdir -p /etc/nginx/conf.d

# Создание конфигурационного файла для Nginx
RUN echo "server { \
    listen 80; \
    server_name localhost; \
    root /opt/www; \
    index index.html; \
}" > /etc/nginx/http.d/default.conf

# Открытие порта 80
EXPOSE 80

# Запуск nginx в переднем плане
CMD ["nginx", "-g", "daemon off;"]

