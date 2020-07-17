FROM maven:3.6.3-jdk-8 AS build-env

RUN mvn clean package

ARG JAR_FILE=target/transaction-service.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]
