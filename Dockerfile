FROM openjdk:8-jdk-alpine
EXPOSE 8081
ADD target/hello-world-java-rest-api-cicd-docker-kubernetes.jar hello-world-java-rest-api-cicd-docker-kubernetes.jar
ENTRYPOINT ["sh", "-c", "java -jar /hello-world-java-rest-api-cicd-docker-kubernetes.jar"]
