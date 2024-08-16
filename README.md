# Tofu-EKS-Jokes
 Powered by Terraform/OpenTofu, delivering a daily dose of tech-inspired laughter.

<div align="center">

<!-- ![banner](docs/banner.png) -->

![](https://img.shields.io/badge/ArgoCD--orange?style=plastic&logo=argo)&nbsp;
![](https://img.shields.io/badge/OpenTofu/Terraform-1.8.1-yellow?style=plastic&logo=opentofu)&nbsp;
![](https://img.shields.io/badge/docker--blue?style=plastic&logo=docker)&nbsp;
![](https://img.shields.io/badge/ECR--orange?style=plastic&logo=ecr)&nbsp;
![](https://img.shields.io/badge/Python-3.10-blue?style=plastic&logo=python)&nbsp;

</div>

## Deploy on Local cluster

### 1. Cluster management
- deploy the local cluster
  ```
  bash local_cluster.sh deploy
  ```
- destroy local cluster 
  ```
  bash local_cluster.sh destroy
  ```

### 2. Configure ArgoCD
- Deploy ArgoCD on the cluster
  ```
  kubectl create namespace argocd
  kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
  ```
- check pods in the ns 
  ```
  kubectl get pods -n argocd
  ```
- Before getting to accessing the argocd UI, let's copy the password. User name is `admin`
  ```
  kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d && echo
  ```
- port forward the argocd service to a `8443` host port.
  Note: you can use NodePort, or Ingress as well to access the UI aswell.
  ```
  kubectl port-forward -n argocd service/argocd-server 8443:443
  ```
  Configure you application or you can use a [yaml manifest](/infrastructure/argo/joke_application) as well.
  You have to be on the argo namespace -
  ```
  sudo kubectl config set-context --current --namespace=argocd
  ```
  apply - `kubectl create -f joke_application.yaml`



## Steps to deploy to EKS Cluster
- [x] Create a cluster (Control Plane)
  - [x] VPC
  - [x] subnets 
  - [x] security group
  - [x] IAM assume role

- [x] Create a NodeGroup (worker Nodes)
  - [x] IAM role
  - [x] IAM policy
  - [ ] Launch Template

- [x] Deploy Pods
  - [x] deployment manifest
  - [x] service manifest (type: load balancer)

## Infrastructure As Code

### backend (chicken or the egg)
- [x] Create backend with
  - [x] states bucket
  - [x] ECR registry

### Others
- [ ] 
