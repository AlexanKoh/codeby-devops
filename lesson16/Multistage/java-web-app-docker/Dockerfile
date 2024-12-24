FROM maven:3.8-openjdk-11 AS build

WORKDIR /app

# Копируем файлы проекта в контейнер
COPY . .

# Выполняем сборку приложения
RUN mvn clean package

# Выводим содержимое директории target
RUN echo "Содержимое директории target:" && ls -l /app/target

FROM tomcat:9-jdk11-openjdk

# Копируем .war файл из первого этапа в директорию webapps Tomcat
COPY --from=build /app/target/java-web-app-1.0.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]

