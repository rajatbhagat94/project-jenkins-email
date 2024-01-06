FROM tomcat:latest
COPY /target/LoginWebApp.war /usr/local/tomacat/webapps
WORKDIR /usr/local/tomacat/webapps
RUN sudo chmod -R 700 /usr/local/tomacat/webapps
EXPOSE 8080
CMD ["catalina.sh" ,"run"]
