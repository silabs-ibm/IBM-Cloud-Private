# Simple spring starter project with  with built in actuator package and all management endpoints exposed.

1) Build the application with maven: mvn clean package docker:build -Ddocker.image.prefix=docker.io/<username>
A docker image is built and uploaded to Docker hub.

2) Execute the appliation locally: mvn spring-boot:run

3) Access the application: http://<ip>:8080/actuator/info

4) Health of the application: http://<ip>:8080/actuator/health

5) Prometheus Metrics exposed by the application: http://<ip>:8080/actuator/prometheus

6) Shutdown the application: curl -X POST http://<ip>:8080/actuator/shutdown