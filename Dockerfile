FROM openjdk:8-jdk-alpine

RUN mvn clean package

ARG JAR_FILE=target/transaction-service.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
