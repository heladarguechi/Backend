FROM openjdk:8-jre-alpine
ADD target/appAchat.jar appAchat.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "appAchat.jar"]
