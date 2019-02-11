#!/usr/bin/env bash

set -e

# Build the project and docker images
mvn clean install -DpushImage

# Remove existing deployments
kubectl delete -f k8s/processor.yaml
kubectl delete -f k8s/composite-op.yaml
kubectl delete -f k8s/basic-op-divide.yaml
kubectl delete -f k8s/basic-op-multiply.yaml
kubectl delete -f k8s/basic-op-subtract.yaml
kubectl delete -f k8s/basic-op-add.yaml

kubectl delete -f k8s/calculator-discovery.yaml
kubectl delete -f k8s/zipkin.yaml

# Create new deployments
kubectl apply -f imagepolicy.yaml
kubectl apply -f ingress.yaml

kubectl apply -f k8s/calculator-discovery.yaml
kubectl apply -f k8s/zipkin.yaml

kubectl apply -f k8s/processor.yaml
kubectl apply -f k8s/composite-op.yaml
kubectl apply -f k8s/basic-op-divide.yaml
kubectl apply -f k8s/basic-op-multiply.yaml
kubectl apply -f k8s/basic-op-subtract.yaml
kubectl apply -f k8s/basic-op-add.yaml
