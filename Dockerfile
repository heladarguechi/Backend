FROM openjdk:8-jre-alpine
ADD target/tpchatProject-1.0.jar tpAchatProject-1.0.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "spring-boot-docker.jar"]
