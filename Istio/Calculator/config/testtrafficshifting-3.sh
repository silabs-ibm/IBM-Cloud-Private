echo "curl -s 'http://compositeop/compositeop/eval?expr=1%20%2B%202%20*%203'"
kubectl exec -it $1 -n $2 -c debug-container -- curl -s 'http://compositeop/compositeop/eval?expr=1%20%2B%202%20*%203'

echo "curl -s --header 'version:v2' 'http://compositeop/compositeop/eval?expr=1%20%2B%202%20*%203'"
kubectl exec -it $1 -n $2 -c debug-container -- curl -s --header 'version:v2' 'http://compositeop/compositeop/eval?expr=1%20%2B%202%20*%203'