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

desc "Delete and recreate namespace for deployment demo, this could take a while..."
kubectl delete ns demo-dep >/dev/null 2>&1
while kubectl get namespace demo-dep >/dev/null 2>&1; do
    # do nothing 
    :
done

run "kubectl label node -l node-role.kubernetes.io/worker=true kubernetes.io/node-function-"
run "kubectl create ns demo-dep"
