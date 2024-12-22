## [Servlet](http://n5g.wikispaces.com/Servlet)

### Описание
**Цель:** Написать простое Web-приложение используя Servlet.<BR>
**Что использовалось:**<BR>
Maven - сборщик проектов<BR>
Apache Tomcat - контейнер сервлетов<BR>

### Сборка проекта в war
в папке _simple-servlet_ вызовите команду _mvn_<BR>
результаты сборки будут в папке _simple-servlet\target\_<BR>
копируем файл _simple-servlet.war_ в _Tomcat\webapps\_<BR>

### Url используемые в этом примере
_http://localhost:8080/simple-servlet/servlets/WelcomeServlet.html_ - главная станица с кнопкой для вызова сервлета<BR>
_http://localhost:8080/simple-servlet/welcome1_ - сервлет<BR>
