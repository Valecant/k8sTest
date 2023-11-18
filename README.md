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
    kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'  
    kubectl patch svc argocd-server -n argocd -p '{ "apiVersion": "v1","spec":{"ports": [{"port":443,"protocol":"TCP","targetPort":443,"nodePort":8080}]}}'
    kubectl patch svc argocd-server -n argocd -p '{ "apiVersion": "v1","spec":{"ports": [{"port":80,"protocol":"TCP","targetPort":80,"nodePort":5482}]}}'

127.0.0.1    localhost

