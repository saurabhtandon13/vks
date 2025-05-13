kubectl create ns istio-system

echo "###################################"
sleep 3

istioctl install --set profile=minimal --set components.cni.enabled=true -y

echo "###################################"
sleep 25

kubectl get pods -n istio-system -o custom-columns="NAME:.metadata.name,NODE:.spec.nodeName"

echo "###################################"
sleep 4

kubectl create ns bookinfo

sleep 3

kubectl label namespace bookinfo istio-injection=enabled


kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.24/samples/bookinfo/platform/kube/bookinfo.yaml -n bookinfo
echo "###################################"
sleep 30

kubectl -n bookinfo apply -f bookinfo-gateway.yaml && kubectl -n bookinfo wait --for=condition=programmed gtw bookinfo-gateway
echo "###################################"
sleep 10

istioctl analyze -n bookinfo
echo "###################################"
sleep 2

kubectl -n bookinfo get pods -o name | xargs -I {} kubectl -n bookinfo logs {} -c istio-proxy |  awk '{print $4,$5,$6,$7,$8}' | grep ready
echo "###################################"
sleep 2

kubectl -n bookinfo get svc bookinfo-gateway-istio -o jsonpath='{.status.loadBalancer.ingress[0].ip}';echo

echo "###################################"
sleep 3

kubectl apply -f prometheus.yaml
echo "###################################"
sleep 20

kubectl apply -f kiali.yaml
