FROM  maven As build
WORKDIR /build
COPY . /build
RUN mvn clean install

FROM openjdk:17-alpine
WORKDIR /test
COPY --from=build target/app-0.0.1-SNAPSHOT.war /test
CMD  ["java", "-jar", "app-0.0.1-SNAPSHOT.war", "--server.port=8081"]
EXPOSE 8081
