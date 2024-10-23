# Use a base image with Java installed
FROM openjdk:17-jdk-slim as build

# Set the working directory
WORKDIR /app

# Copy the Maven wrapper and pom.xml
COPY mvnw ./
COPY .mvn ./.mvn
COPY pom.xml ./

# Download the dependencies (this will cache the dependencies if unchanged)
RUN ./mvnw dependency:go-offline

# Copy the source code
COPY src ./src

# Package the application
RUN ./mvnw package -DskipTests

# Use a smaller base image for running the app
FROM openjdk:17-jdk-slim
VOLUME /tmp
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar demo.jar
ENTRYPOINT ["java", "-jar", "/demo.jar"]
