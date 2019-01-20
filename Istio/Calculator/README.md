# Calculator
A simple polyglot microservices application to experiment with and understand features of istio service mesh.
![calculator](calculator.png?raw=true "calculator")

## Getting Started
Clone the project "git clone https://github.com/abalasu1/calculator.git"

### Prerequisites
1. A working kubernetes cluster like IBM Cloud Private (1.6 or latter)
2. Set up kubectl to point to a valid kubernetes cluster
3. Install istio on the cluster (https://istio.io/docs/setup/kubernetes/) 0.6 or latter
4. python, node.js, ruby, go compilers are needed to compile locally

### Deployment
To deploy the entire application:
1) "make init-all" command initializes all the services, ingress and other cluster roles needed
2) "make deploy-all" deploys all the services

To deploy the services one by one:
1) "make init-add" and "make deploy-add" to deploy add service.
2) "make init-subtract" and "make deploy-subtract" to deploy subtract service.
3) "make init-multiply" and "make deploy-multiply" to deploy multiply service.
4) "make init-divide" and "make deploy-divide" to deploy divide service.
5) "make init-compositeop" and "make deploy-compositeop" to deploy compositeop service.
6) "make init-processor" and "make deploy-processor" to deploy processor service.

## Running the tests
1) "make test-processor" to test the services end to end
2) Individual services can be tested easily with "make test-add" ...

3) use make init-ts1 and test-ts1 pair to test individual istio features:

a) ts1 - Traffic management: send all traffic to compositeop v 1.0
b) ts2 - Traffic management: send all traffic to compositeop v 3.0
c) ts3 - Traffic management: send all traffic to compositeop v 2.0 using
the header set for version label

## Authors
Arun Balasubramanyan

## License
This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details