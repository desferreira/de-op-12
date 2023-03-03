FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /build
COPY ./ .
RUN ./mvnw clean install -DskipTests

FROM openjdk:20-jdk-slim-buster as runner
WORKDIR /app
COPY --from=builder /build/target/pokemonapp-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]