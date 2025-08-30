FROM eclipse-temurin:21-jdk

WORKDIR /home/app

ENTRYPOINT ["java", "-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=*:5005", "-jar", "medical-clinic-1.0.jar"]
