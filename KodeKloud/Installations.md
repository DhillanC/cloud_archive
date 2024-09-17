## Docker

## Kubernetes

## Istio
    Install istioctl on your local
        Instructions
            https://github.com/istio/istio/releases
        Commands: 
            curl -L https://istio.io/downloadIstio | sh -
            curl -L https://istio.io/downloadIstio | ISTIO_VERSION=1.23.1 TARGET_ARCH=x86_64 sh -

    Install istio into your cluster
        After installing/adding istioctl binary and path
        istioctl install --set profile=demo
    
        Example:
            curl -L https://istio.io/downloadIstio | sh -
            cd istio-<version-number>
            export PATH=$PWD/bin:$PATH
            istioctl install --set profile=demo -y
        
        To verify istio was properly installed
            istioctl verify-install

        Enable/Disable istio injection
            kubectl label namespace default istio-injection=enabled
            kubectl label namespace default istio-injection=disabled
        To check the mesh status
            istioctl analyze

### Kiali
    
    Install
        kubectl apply -f "path"
        kubectl apply -f "D:\Archivos de programa\istio-1.23.1\samples\addons"
        
        To verify the kiali deployment
            kubectl rollout status deployment/kiali -n istio-system

        To verify the kiali service is running
            kubectl -n istio-system get svc kiali
    
    Start Kiali dashboard
        istioctl dashboard kiali
