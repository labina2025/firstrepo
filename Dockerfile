FROM openjdk:21-jdk-slim AS builder
WORKDIR /app
COPY HelloWorld.java .
RUN javac HelloWorld.java
FROM openjdk:21-jre-slim
WORKDIR /app
CMD ["java", "HelloWorld"]
