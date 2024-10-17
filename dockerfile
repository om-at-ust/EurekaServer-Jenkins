FROM amazoncorretto:23
COPY ./target/EurekaServer-0.0.1-SNAPSHOT EurekaServer.jar
CMD ["java","-jar","EurekaServer-0.0.1-SNAPSHOT"]