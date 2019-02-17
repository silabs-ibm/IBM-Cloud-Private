# Headless Services with Selectors

- Nginx container with 3 replicas and a headless service with selector

- Deploy with "kubectl apply -f svc_with_selectors.yaml"

- Run a debugging pod. kubectl run -i -t netdebug --image=mcastelino/nettools --restart=Never -n learning

- nslookup nginx.learning.svc.cluster.local should return three ip addresses of the three replicas

- Look at the endpoints of the three pods used by the headless service. kubectl get ep -n learning

![](https://user-images.githubusercontent.com/13202504/52911985-2f063380-32d1-11e9-9830-1916a383977d.png)

# Headless Services with No Selectors

- Used to point to external services (kubectl apply -f svc_with_no_selectors.yaml)

![](https://user-images.githubusercontent.com/13202504/52912026-b94e9780-32d1-11e9-9318-456306ba40e6.png)
