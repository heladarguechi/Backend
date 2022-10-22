FROM openjdk:8-jre-alpine
ADD target/appachat.jar appachat.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "appachat.jar"]
