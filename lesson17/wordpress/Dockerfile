FROM wordpress:latest

# Копируем локальные конфиги Apache в контейнер
COPY ./apache-config/ /etc/apache2/sites-enabled/

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Устанавливаем команду запуска
CMD ["apache2-foreground"]

