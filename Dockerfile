# Use an official Maven image as a base image
FROM maven:3.8.4-openjdk-11-slim AS builder

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml file into the container at /app
COPY pom.xml .

# Copy the rest of the application code into the container at /app
COPY src ./src

# Run Maven to download dependencies and build the application
RUN mvn clean install -DskipTests

# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at /app
COPY --from=build /webapp/target/webapp.war .

# Specify the command to run on container start
CMD ["java", "-war", "webapp.war"]


