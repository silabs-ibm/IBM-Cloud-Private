# IBM-Cloud-Private
## Code samples, presentations and materials for IBM Cloud Private

### Table of Contents:
- Common:

[SpringAppWithMonitoring](Common/SpringAppWithMonitoring): A simple spring application with built in actuator package and all management endpoints exposed.

- E2E-Applications:

[Calculator-Spring-Boot](E2E-Applications/Calculator-Spring-Boot): A spring boot implementation of the calculator application, with discovery through eureka, tracing and monitoring support, microservices with kafka

- Istio:

[Calculator](Istio/Calculator): A simple microservices application with istio to demonstrate various features.

- Presentations:

[Concepts_Short.pdf](Presentations/Concepts_Short.pdf): A visual presentation of components within IBM Cloud Private.

[IDD_Cloud_Track_Session4_Arun.pptx](Presentations/Developer_Day_Bangalore-Mar_2019/IDD_Cloud_Track_Session4_Arun.pptx): Developer day presentation on kubernetes.

- Mcm:

[simpleapp](Mcm/simpleapp): Simple Nginx application deployed in a multi cloud manager environment.

[guestbook](Mcm/guestbook): Guestbook application with a frontend and redis master & slave.

- Probes:

[Java_Spring_http](Probes/Java_Spring_http): HTTP probes for a simple spring java applicaton using builtin actuator package.

[Command_Probes](Probes/Command_Probes): Command based liveness & readiness probes.

[TCP_Probes](Probes/Tcp_Probes): TCP based liveness & readiness probes.

[HTTP_Probes](Probes/Http_Probes): HTTP based liveness & readiness probes.

- Monitoring:

[Java_Spring_Prometheus](Monitoring/Java_Spring_Prometheus): Spring app with prometheus metrics exposed and tracked through a grafana dashboard.

- Services:

[Headless](Services/Headless): Headless Service with selectors and no selectors.

[Haproxy](Services/Haproxy): Set up haproxy as the load balancer for applicaions.

- Security:

[Network_Policies](Security/Network_Policies): Secure microservices deployed on kubernetes using network policies.

[RBAC](Security/Rbac): Presentation on Role based access control and sample files.

[Image_Policy](Security/Image_Policy): Image policy to restrict permissible registries to pull from, apply within a namespace.

## Authors
Arun Balasubramanyan

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details