curl --max-time 1 "http://svc-add.calc-backend/basicop/add?n1=100&n2=200"
echo ""
echo "200+100=300"
curl --max-time 1 "http://svc-subtract.calc-backend/basicop/subtract?n1=200&n2=100"
echo ""
echo "200-100=100"
curl --max-time 1 "http://svc-multiply.calc-backend/basicop/multiply?n1=10&n2=20"
echo ""
echo "10*20=200"
curl --max-time 1 "http://svc-divide.calc-backend/basicop/divide?n1=200&n2=100"
echo ""
echo "200/100=2"
curl --max-time 1 "http://svc-compositeop.calc-backend/compositeop/eval?expr=(10*3)%2B5-10/5"
echo "(10*3)+5-10/5=33"
curl --max-time 10 -X POST http://svc-processor.calc-frontend/processor/calculate?verbosity=1 -H 'Content-Type: application/json' -d '{
    "x1": "2 + 3 + 4",
    "x2": "3 - 2",
    "x3": "3 * 2",
    "x4": "4 / 2",
    "x5": "1 + 2 + 3 + 4 + 33 - 6 - 7 * 3 + 12 / 4",
    "x6": "12 / 4 / 3"
}'
echo ""

curl "http://svc-add.calc-backend/basicop/add?n1=100&n2=200"

kubectl exec -it $(kubectl get pods -l purpose=debug -o jsonpath="{.items[].metadata.name}" -n calc-frontend) -n calc-frontend sh
kubectl exec -it $(kubectl get pods -l purpose=curl -o jsonpath="{.items[].metadata.name}" -n debug) -n debug sh
kubectl exec -it $(kubectl get pods -l purpose=debug -o jsonpath="{.items[].metadata.name}" -n calc-backend) -n calc-backend sh


txt="vulnerability";ns="kube-system";type="pods"; kubectl -n $ns get $type | grep "$txt" | awk '{ print $1 }' | xargs kubectl -n $ns delete $type --force --grace-period=0
txt="0/";ns="kube-system";type="pods"; kubectl -n $ns get $type | grep "$txt" | awk '{ print $1 }' | xargs kubectl -n $ns delete $type --force --grace-period=0
txt="mc-v1";ns="default";type="pods"; kubectl -n $ns get $type | grep "$txt" | awk '{ print $1 }' | xargs kubectl -n $ns delete $type --force --grace-period=0
