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

desc "Istio Demo, First look at istio installation"
run "kubectl get pods -n istio-system"

desc "Look at the label for calculator namespace"
run "kubectl get ns --show-labels"

desc "Lets look at the calculator application"
run "kubectl get pods -n calculator"

desc "Describe the pod to see istio proxy details"
ADD_POD=$(kubectl get pod -n calculator -l app=add | tail -1 | cut -f1 -d' ')
run "kubectl -n=calculator describe pod $ADD_POD"

desc "Annotation to prevent sidecar injection"
run "kubectl -n=calculator get deployment redis -o yaml"

desc "istio ingress controller"
run "cat ../../ingress.yaml"

desc "Set up monitoring"
run "echo 'make monitor-new' in a new window"

desc "run initial test for workloads"
run "echo 'run tests in other window'"

desc "Walkthrough kiali console"
run "echo 'http://localhost:20001/kiali/'"

desc "Traffic shaping scenario - 1 (v1 - 80%, v2 - 10%, v3 - 10%)"
run "cat ../../config/trafficshifting-1.yaml"
desc "Run Traffic shaping scenario - 1"

desc "Traffic shaping scenario - 2 (v1 - 10%, v2 - 10%, v3 - 80%)"
run "cat ../../config/trafficshifting-2.yaml"
desc "Run Traffic shaping scenario - 1"

desc "Traffic shaping scenario - 3 based on header"
run "cat ../../config/trafficshifting-3.yaml"
desc "Run Traffic shaping scenario - 1"

desc "Traffic mirroring"
run "cat ../../config/trafficmirroring.yaml"
desc "Run Traffic Mirroring scenario with jeagar tracing"
run "kubectl get pods -n calculator -o wide"

desc "Jeagar tracing"

desc "Fixed Delay"
run "cat ../../config/fixeddelay.yaml"
desc "Run Fixed Delay"

desc "request timeout"
run "cat ../../config/requesttimeout.yaml"
desc "Run request timeout"

desc "circuit broker"
run "cat ../../config/circuitbreaker.yaml"
desc "Run circuit broker"

desc "security policy"
run "cat ../../config/securitypolicy.yaml"

desc "execute a query from the debug pod"
DEBUG_POD=$(kubectl get pod -n calculator -l app=debug | tail -1 | cut -f1 -d' ')
desc "Run security policy"

desc "grafana monitoring"
desc "prometheus monitoring"