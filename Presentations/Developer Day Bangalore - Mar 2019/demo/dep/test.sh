while kubectl get pods -n demo-dep > /dev/null
do
    sleep 1
    echo "working..."
done
