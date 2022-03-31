FROM openjdk:11
VOLUME /tmp
COPY target/*.war /appRegister.war
CMD ["java", "-jar", "/appRegister.war", "--spring.profiles.active=prod"]
EXPOSE 8761