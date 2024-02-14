# build image 
docker buildx build --platform linux/amd64 -t ashraftheminhaj/jokes:v1 -f Dockerfile .
echo "TOKEN" | sudo docker login --username=ashraftheminhaj --password-stdin
docker login -u ashraftheminhaj


# rm .kube/config
# get contexts
kubectl config current-context
kubectl config get-clusters

# list contexts
kubectl config get-contexts

# add a new context
# why do we have to update it everytime?
aws eks update-kubeconfig --region ap-south-1 --name eks-jokes-app-cluster-dev

# use the context
kubectl config use-context arn:aws:eks:ap-south-1:408498059527:cluster/eks-jokes-app-cluster-dev

# then kubectl apply -f manifest.yaml