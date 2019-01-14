# Monitoring spring application with prometheus and grafana

- Deploy simple spring application [SpringAppWithMonitoring](Common/SpringAppWithMonitoring)

- Deploy spring app into kubernetes with deployment.yaml and service.yaml. A make file makes deployment easier. Use "make deploy" to deploy the app onto kubernetes.

- Navigaete to http://<proxy-ip>:<port>/actuator/Prometheus to look at the prometheus metrics exposed by the application. Use kubectl get svc to find the external port to access the application.

- "make inittest" to deploy fortio container for load testing the application.

- "make loadtest" to generate some load on the application.

- Browse to "Platform|Monitoring" on the ICP console. Import the java/micrometer dashboard from the
grafana marketplace.