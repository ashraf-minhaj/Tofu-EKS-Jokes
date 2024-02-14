# rm .kube/config

# get contexts
kubectl config current-context
kubectl config get-clusters

# list contexts
kubectl config get-contexts

# add a new context
aws eks update-kubeconfig --region ap-south-1 --name eks-jokes-app-cluster-dev

# use the context
kubectl config use-context arn:aws:eks:ap-south-1:408498059527:cluster/eks-jokes-app-cluster-dev