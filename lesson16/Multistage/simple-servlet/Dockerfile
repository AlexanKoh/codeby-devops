# Этап 1: Сборка приложения с помощью Maven
FROM maven:3.8-openjdk-11 AS build

WORKDIR /app

# Копируем файлы проекта
COPY . .

# Выполняем сборку приложения
RUN mvn clean package

# Этап 2: Запуск приложения с использованием Tomcat
FROM tomcat:9-jdk11-openjdk

# Копируем .war файл из первого этапа в директорию webapps Tomcat
COPY --from=build /app/target/simple-servlet.war /usr/local/tomcat/webapps/

# Открываем порт 8080
EXPOSE 8080

# Запускаем Tomcat
CMD ["catalina.sh", "run"]

