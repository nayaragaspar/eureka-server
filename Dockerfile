FROM maven:3.8.5-openjdk-17 as build
WORKDIR /
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17
ENV CONFIG_SERVER config-server
WORKDIR /app
COPY --from=build ./target/*.jar ./app.jar
EXPOSE 8761
ENTRYPOINT java -jar app.jar
