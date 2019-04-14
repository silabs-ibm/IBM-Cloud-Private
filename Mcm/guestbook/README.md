# Guestbook Application Helm Chart
Sample application that shows how to use IBM Mulcicloud Manager features and run the application across differnet Kubernetes environment.

Install instructions:

- Set up kubectl and helm cli 

- cd "Mcm/guestbook" (browse to the guestbook folder)

- helm install guestbook --name=gbapp --namespace=guestbook

- Edit placement policy to move application from one cluster to another

- kubectl apply -f compliance

## Chart Details
This chart defines the guestbook application using the kubernetes application definition and the extensions provided by IBM Multicloud Manager to deploy and mamnage the application.  This allows users to deploy the application to one or more cluster and asociate the application deployment to compliance policies.  Using this model enables an application helth dashboard with details of the PODS that support the applicstion.

## Multicluster enablement
Using IBM Multicloud manager and placement policies included in this application, user can select one ore more cluster to run this application from a single management console.

## Multi-arch support
By default, the chart is configured for amd64. You can change image names in the chart (mainly in values.yaml) to the arch which you intend to use.
