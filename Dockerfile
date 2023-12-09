FROM openjdk:8
EXPOSE 8080
ADD ttarget/mongo-demo-0.0.1-SNAPSHOT.jar mongo-demo-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/mongo-demo-0.0.1-SNAPSHOT.jar"]


