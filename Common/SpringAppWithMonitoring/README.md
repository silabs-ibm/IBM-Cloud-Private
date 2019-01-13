# Simple spring starter project with  with built in actuator package and all management endpoints exposed.

1) Build the application with maven: mvn clean package docker:build -Ddocker.image.prefix=<username> -DpushImage
A docker image is built and uploaded to Docker hub. See this link to configure docker authentication with maven 
plugin: https://stackoverflow.com/questions/1261215/maven-command-to-determine-which-settings-xml-file-maven-is-using 

2) Execute the appliation locally: mvn spring-boot:run

3) Access the application: http://<ip>:8080/actuator/info

4) Health of the application: http://<ip>:8080/actuator/health

5) Prometheus Metrics exposed by the application: http://<ip>:8080/actuator/prometheus

6) Shutdown the application: curl -X POST http://<ip>:8080/actuator/shutdown