# Istio Samples 

Start Kiali dashboard
    istioctl dashboard kiali

## Book info
    https://istio.io/latest/docs/examples/bookinfo/
    D:\Archivos de programa\istio-1.23.1\samples

    kubectl apply -f "D:\Archivos de programa\istio-1.23.1\samples\bookinfo\platform\kube\bookinfo.yaml"
    kubectl delete -f "D:\Archivos de programa\istio-1.23.1\samples\bookinfo\platform\kube\bookinfo.yaml"

### Gateway
        D:\Archivos de programa\istio-1.23.1\samples\bookinfo\networking\bookinfo-gateway.yaml
        kubectl apply -f "D:\Archivos de programa\istio-1.23.1\samples\bookinfo\networking\bookinfo-gateway.yaml"
        kubectl delete -f "D:\Archivos de programa\istio-1.23.1\samples\bookinfo\networking\bookinfo-gateway.yaml"

        Setting up ingress host
            Linux: 
                export INGRESS_HOST=#(minikube ip)
                echo $INGRESS_HOST
            Windows: 
                $INGRESS_HOST = (minikube ip)
                echo $INGRESS_HOST
        Setting up ingress port
            Linux: 
                export INGRESS_PORT=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.spec.ports[?(@.name=="http2")].nodePort}')
                echo $INGRESS_PORT
            Windows: 
                $INGRESS_PORT = $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath="{.spec.ports[?(@.name=='http2')].nodePort}")
                echo $INGRESS_PORT
        Setting external-ip for istio-ingressgateway LoadBalancer
            minikube tunnel

while ($true) {
    # Your commands go here
    curl http://localhost:8080/productpage
    # Sleep for 0.01 seconds
    Start-Sleep -Seconds 0.01
}



### Troubleshooting    

            Verify External-IP
                kubectl get svc -n istio-system istio-ingressgateway
            Ingress pod
                kubectl get pods -n istio-system
                kubectl describe pod -n istio-system -l app=istio-ingressgateway
            Get adapters
                Get-NetAdapter

            Alternative: forward a Local Port to the Istio Ingress Gateway:
                kubectl port-forward -n istio-system svc/istio-ingressgateway 8080:80
                curl http://localhost:8080/productpage


            IstioDocs
            $INGRESS_NAME = "istio-ingressgateway"
            $INGRESS_NS = "istio-system"
            $GATEWAY_URL = "${INGRESS_HOST}:${INGRESS_PORT}"
            
            UsingNodeports for Docker dektop
                https://istio.io/latest/docs/tasks/traffic-management/ingress/ingress-control/#determining-the-ingress-ip-and-ports

                $INGRESS_PORT = $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath="{.spec.ports[?(@.name=='http2')].nodePort}")
                $SECURE_INGRESS_PORT = $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath="{.spec.ports[?(@.name=='https')].nodePort}")
                $TCP_INGRESS_PORT = $(kubectl -n istio-system get service istio-ingressgateway -o jsonpath="{.spec.ports[?(@.name=='tcp')].nodePort}")
                Docker For Desktop:
                $INGRESS_HOST = "127.0.0.1"

            Cleanup IstioAPIs
                kubectl delete gateway httpbin-gateway
                kubectl delete virtualservice httpbin
                kubectl delete --ignore-not-found=true -f samples/httpbin/httpbin.yaml
            Cleanup Gateway APIs
                kubectl delete httproute httpbin
                kubectl delete gtw httpbin-gateway
                kubectl delete --ignore-not-found=true -f samples/httpbin/httpbin.yaml
            linux:
            curl "http://$INGRESS_HOST:$INGRESS_PORT/productpage"
            Windows:
            curl "http://${INGRESS_HOST}:${INGRESS_PORT}/productpage"
            echo "http://${INGRESS_HOST}:${INGRESS_PORT}/productpage"



