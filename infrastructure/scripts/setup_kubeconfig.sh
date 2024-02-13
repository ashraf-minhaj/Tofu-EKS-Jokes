rm .kube/config

aws eks update-kubeconfig --region ap-south-1 --name eks-jokes-app-cluster-dev