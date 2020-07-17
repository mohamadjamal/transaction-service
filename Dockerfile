## 1. Base Image
FROM maven:3.6.3-jdk-8 AS build-env

## 2. Create app directory
WORKDIR /usr/src/app

## 3. Copy files which contains project dependencies
COPY pom.xml /usr/src/app

## 4. Copy all source codes from application / microservice
COPY src /usr/src/app/src

## 5. package the artifact
RUN mvn clean package

FROM maven:3.6.3-jdk-8 AS runtime-env

## 6. Copy artificat
COPY --from=build-env /usr/src/app/target/transaction-service-0.0.1-SNAPSHOT.jar app.jar

## 7. Execute
ENTRYPOINT ["java", "-jar", "app.jar"]
