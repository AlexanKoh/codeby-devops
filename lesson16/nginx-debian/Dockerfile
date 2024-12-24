# Используем базовый образ debian:11
FROM debian:11

# Установка nginx
RUN apt-get update && apt-get install -y nginx

# Создание директории для веб-контента
RUN mkdir -p /opt/www

# Добавление index.html в папку /opt/www
RUN echo "<html><body><h1>Hello from Nginx on Debian!</h1></body></html>" > /opt/www/index.html

# Создание конфигурации для nginx
RUN echo "server { \
    listen 80; \
    server_name localhost; \
    root /opt/www; \
    index index.html; \
}" > /etc/nginx/sites-available/default

# Открытие порта 80
EXPOSE 80

# Запуск nginx через Entrypoint
ENTRYPOINT ["nginx", "-g", "daemon off;"]

