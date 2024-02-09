FROM openjdk:8
EXPOSE 8087
ADD target/springdevops.jar springdevops.jar
ENTRYPOINT ["java", "-jar", "/springdevops.jar"]