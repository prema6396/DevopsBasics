
FROM maven:3.5.4-jdk-8-alpine as maven

COPY ./pom.xml ./pom.xml


RUN mvn dependency:go-offline -B

RUN mvn package

FROM openjdk:8u171-jre-alpine

WORKDIR /app

COPY --from=maven target/webapp.war ./webapp.war

CMD ["java", "-war", "./webapp.war"]
