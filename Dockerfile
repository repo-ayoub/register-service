FROM openjdk:11
VOLUME /tmp
ADD target/*.jar /appRegister.jar
CMD ["java", "-jar", "/appRegister.jar", "--spring.profiles.active=prod"]
EXPOSE 8761