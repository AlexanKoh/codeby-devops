FROM mysql:latest

# Устанавливаем переменные среды для конфигурации MySQL
ENV MYSQL_ROOT_PASSWORD=root_password
ENV MYSQL_DATABASE=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=wordpress_password

# Устанавливаем рабочую директорию
WORKDIR /var/lib/mysql

# Команда запуска MySQL
CMD ["mysqld"]

