NAMESPACE=learning
PROJECT=k8swebapp

FORTIO_POD=$(shell kubectl get pod -n $(NAMESPACE) -l app=fortio -o jsonpath='{.items[0].metadata.name}')

init:
	kubectl apply -f ./fortio.yaml -n $(NAMESPACE)
	
deploy:
	kubectl apply -f ./service.yaml -n $(NAMESPACE)
	kubectl apply -f ./deployment.yaml -n $(NAMESPACE)
	
loadtest:
	kubectl exec -it $(FORTIO_POD) -n $(NAMESPACE) fortio -- load -c 10 -qps 100 -n 10000 -loglevel Warning "http://k8swebapp.learning/actuator"
	
delete:
	kubectl delete -f ./service.yaml -n $(NAMESPACE)
	kubectl delete -f ./deployment.yaml -n $(NAMESPACE)
	kubectl delete -f ./fortio.yaml -n $(NAMESPACE)