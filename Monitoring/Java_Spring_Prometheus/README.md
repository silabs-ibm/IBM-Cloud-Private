# Monitoring spring application with prometheus and grafana

- Deploy simple spring application [SpringAppWithMonitoring](Common/SpringAppWithMonitoring)

- Deploy spring app into kubernetes with deployment.yaml and service.yaml. A make file makes deployment easier. Use "make deploy" to deploy the app onto kubernetes.

- Navigaete to http://<proxy-ip>:<port>/actuator/Prometheus to look at the prometheus metrics exposed by the application. Use kubectl get svc to find the external port to access the application.

- "make inittest" to deploy fortio container for load testing the application.

- ![Browse to "Platform|Monitoring" on the ICP console. Import the java/micrometer dashboard from the
grafana marketplace.](https://user-images.githubusercontent.com/13202504/51103212-ef4ab880-1807-11e9-8d00-fad95b8c528b.png)

- ![Import java multimeter dashboard in grafana.](https://user-images.githubusercontent.com/13202504/51103499-ec9c9300-1808-11e9-8383-587746990c27.png)

- ![Use 3308 as the id for the dashboard to import.](https://user-images.githubusercontent.com/13202504/51103606-6e8cbc00-1809-11e9-8b47-8c3c10a4ef3a.png)

- "make loadtest" to generate some load on the application.

- ![Open the dashboard to see the metrics on the grafana dashboard.](https://user-images.githubusercontent.com/13202504/51103815-1efac000-180a-11e9-8ec8-fafecd9a968c.png)