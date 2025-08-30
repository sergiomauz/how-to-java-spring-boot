# How to create a workspace for a Java Spring Boot Project with Docker

> This is a document to describe step by step how to create a new project using Java Spring Boot, for microservices, APIs and more.

## STEP 1: Create empty project

Go to [Spring Website](https://start.spring.io/) and create an empty project like this:

![screenshot-1](https://i.imgur.com/tYhHvVv.png)

It is important to take into account:

- As **Project** always select Maven, which is like the compiler, framework and libraries repository (an equivalent of MSBUILD and Nugget for .Net).
- As **Language**, always Java.
- In the **Spring Boot** version always select latest stable version, not SNAPSHOT neither M2.
- **Group** is the name of the domain (reversed).
- **Artifact** is the name (separated by dashes and lower case) of the project.
- **Name** is the normal name of the project, like a short, very short description.
- **Description** has a short explanation of the project.
- **Dependencies** is the list of the libraries which the project requires to connect with databases, redis, kafka, create endpoints, add persistence, and more. Remember always add Docker Compose Support.

After filling information, click in Generate, download and unzip in a directory.

![screenshot-2](https://i.imgur.com/udEnZnI.png)

## STEP 2: Configure IntelliJ IDE

All the necessary to configure IntelliJ IDE:

- Add plugins for Docker and Maven:
![screenshot-3](https://i.imgur.com/nyNZuMf.png)

- Configure remote debug for Docker. In this case, project's artifact is "medical-clinic"
![screenshot-4](https://i.imgur.com/280Qzdw.png)

## STEP 3: Add and modify files Dockerfile and compose.yaml

This java project created in the [Spring Website](https://start.spring.io/) has a **compose.yaml** file by default. Is important to replace it with the file in this repository and add **Dockerfile** to complete containers.

In the project, the directory **target** contains compiled applications files (remember create them with the command in terminal before to run docker compose: ``mvn clean package``)

## STEP 4: Run docker compose

Directly execute: ``docker compose -f .\compose.yaml up -d --build --force-recreate``

For Java, port 8080 will be used for the application, and 5005 will be used for the debugger.

Remember that Docker Compose will create new directories for the project (**postgresql** for database, **data** for the Java application data directory).

## STEP 5: Debug in IntelliJ IDE

In the top and right side of IntelliJ IDE, open the list of debuggers and select the correct, in this case "Debug Docker Medical Clinic", then click in the Bug to start debugging; then you can add new breakpoints and move step by step with F7 and F8.

![screenshot-5](https://i.imgur.com/WS8Wy7N.png)
