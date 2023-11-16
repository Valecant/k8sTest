##### start Minikube and check status
    minikube start --vm-driver=hyperkit 
    minikube status


##### STEPS
sudo mkdir -p /mnt/k8s-data/d{1..10}
sudo chmod -R 777 /mnt/k8s-data
    kustomize build mesh-infra/storage/pv/local/devm/ | kubectl apply -f -
    kubectl apply -f mesh-infra/argocd/namespace.yaml
    kustomize build mesh-infra/security/secrets | kubectl apply -f -
    kustomize build plat-infra-services | kubectl apply -f -
    kustomize build plat-app-services | kubectl apply -f -
    kustomize build mesh-infra/argocd | kubectl apply -f -
    istioctl install -y --verify -f mesh-infra/istio/profile.yaml
    kubectl label namespace default istio-injection=enabled
     kustomize build mesh-infra/istio | kubectl apply -f -

