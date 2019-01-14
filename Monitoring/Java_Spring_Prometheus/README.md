# Monitoring spring application with prometheus and grafana

- Deploy simple spring application [SpringAppWithMonitoring](Common/SpringAppWithMonitoring)

- Deploy spring app into kubernetes with deployment.yaml and service.yaml. A make file makes deployment easier. Use "make deploy" to deploy the app onto kubernetes.

- Navigaete to http://<proxy-ip>:<port>/actuator/Prometheus to look at the prometheus metrics exposed by the application. Use kubectl get svc to find the external port to access the application.

- "make inittest" to deploy fortio container for load testing the application.

- Browse to "Platform|Monitoring" on the ICP console. Import the java/micrometer dashboard from the
grafana marketplace.

![](https://user-images.githubusercontent.com/13202504/51103212-ef4ab880-1807-11e9-8d00-fad95b8c528b.png)

- Import java multimeter dashboard in grafana.

![](https://user-images.githubusercontent.com/13202504/51103499-ec9c9300-1808-11e9-8383-587746990c27.png)

- Use 3308 as the id for the dashboard to import.

![](https://user-images.githubusercontent.com/13202504/51103606-6e8cbc00-1809-11e9-8b47-8c3c10a4ef3a.png)

- "make loadtest" to generate some load on the application.

- Open the dashboard to see the metrics on the grafana dashboard.

![](https://user-images.githubusercontent.com/13202504/51103815-1efac000-180a-11e9-8ec8-fafecd9a968c.png)

# Query metrics using prometheus running on ICP:

- Assuming management services are enabled on ICP, prometheus should already be running. Check it using the following command: 
kubectl get pods -n kube-system | grep prom
monitoring-prometheus-75fb5ff6b6-jqwhv                            4/4     Running            8          12d

- Execute "make initmonitor" to initiate port forwarding to prometheus pod on port 9090.

- Browse to http://localhost:9090 to access the prometheus query tool.
![](https://user-images.githubusercontent.com/13202504/51108120-1066d580-1817-11e9-9b27-dff42a19c7e8.png)

- Query for any metrics exposed by the spring application.
![](https://user-images.githubusercontent.com/13202504/51108160-39876600-1817-11e9-8ce7-d506e10f2e65.png)
