FROM maven:3.6.3-jdk-8 AS build-env

## 2. Create app directory
WORKDIR /usr/src/app

## 3. Copy files which contains project dependencies
COPY pom.xml /usr/src/app

## 5. Copy all source codes from application / microservice
COPY src /usr/src/app

RUN mvn clean package

ARG JAR_FILE=target/transaction-service.jar

COPY ${JAR_FILE} app.jar

ENTRYPOINT ["java","-jar","/app.jar"]

