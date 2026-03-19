FROM tomcat:10-jdk17

COPY target/*.war /usr/local/tomcat/webapps/

EXPOSE 8080
