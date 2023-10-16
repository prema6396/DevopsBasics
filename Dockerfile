FROM maven:3.5. 4-jdk-8-alpine as maven.
COPY ./pom.xml ./pom.xml.
COPY --from=maven target/webapp.war ./webapp.war.
CMD ["java", "-war", "./webapp.war"]
