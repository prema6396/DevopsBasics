
# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11:alpine-jre

# Set the working directory in the container
WORKDIR /app

# Copy the packaged JAR file into the container at /app
COPY --from=builder /webapp/target/webapp.war .

# Specify the command to run on container start
CMD ["java", "-war", "webapp.war"]
