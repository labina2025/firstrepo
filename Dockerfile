# Use a valid OpenJDK base image
FROM openjdk:17.0.1-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Java source file into the container
COPY HelloWorld.java .

# Compile the Java program
RUN javac HelloWorld.java

# Run the compiled Java program
CMD ["java", "HelloWorld"]
