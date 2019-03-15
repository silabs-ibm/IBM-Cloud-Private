#!/bin/bash
# Copyright 2016 The Kubernetes Authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

. $(dirname ${BASH_SOURCE})/../util.sh

desc "We are going to create this deployment"
run "cat deployment-1.yaml"

desc "Lets go!!!!"
run "kubectl -n=demo-dep apply -f deployment-1.yaml"

desc "Look at the pods we just created"
run "kubectl -n=demo-dep get pods"

desc "No pods seen, How about deployments & replicasets"
run "kubectl -n=demo-dep get deployments"
run "kubectl -n=demo-dep get replicasets"

desc "Look at the replicaset to determine the error"
LAST_RS=$(kubectl get rs -n demo-dep -l app=web-app | tail -1 | cut -f1 -d' ')
run "kubectl -n=demo-dep describe replicasets $LAST_RS"

desc "Let's give the service account all capabilities, using pod security policy"
cat psp.yaml

desc "Apply the psp ..."
run "kubectl apply -f psp.yaml"

desc "Wait for the pods to get created ..."
sleep 10
run "kubectl -n=demo-dep get pods"

desc "Look at the pods we just created"
run "kubectl -n=demo-dep get pods"

desc "why are they in a pending state?"
LAST_POD=$(kubectl get pods -n demo-dep -l app=web-app | tail -1 | cut -f1 -d' ')
run "kubectl -n=demo-dep describe pod $LAST_POD"

desc "Label all nodes to satisfy node affinity condition"
run "kubectl label node -l node-role.kubernetes.io/worker=true kubernetes.io/node-function=web"

desc "Wait for the changes to take effect ..."
sleep 5

desc "all pods are out of pending state now"
run "kubectl -n=demo-dep get pods"

desc "all pods in crashloopback state, look at logs"
LAST_POD=$(kubectl get pods -n demo-dep -l app=web-app | tail -1 | cut -f1 -d' ')
run "kubectl -n=demo-dep logs $LAST_POD"

desc "Apply fix for the crashloopback problem"
run "kubectl delete -f deployment-1.yaml"
sleep 5
run "kubectl apply -f deployment-2.yaml"
sleep 5

desc "Look at the pods we fixed ..."
run "kubectl -n=demo-dep get pods"

desc "Create a service that fronts any version of this demo"
run "kubectl -n=demo-dep apply -f svc-1.yaml"

kubectl create -f curl.yaml >/dev/null 2>&1

desc "Finally, access the app through http://web-server"
run "kubectl -n=demo-dep exec curl -- curl -sI http://web-server --max-time 1"

desc "Service not working, is it created?"
run "kubectl -n=demo-dep get svc"

desc "Are the endpoints created?"
run "kubectl -n=demo-dep get ep"

desc "Correct Service Selector"
run "kubectl -n=demo-dep apply -f svc-2.yaml"

desc "Finally, access the app through http://web-server"
run "kubectl -n=demo-dep exec curl -- curl -sI http://web-server --max-time 1"
