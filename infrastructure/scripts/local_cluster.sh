#!/bin/bash
# deploys and destroys the local kind cluster

if [[ "$1" == "deploy" ]]; then
    kind create cluster --config ../kind/kind_config.yaml --name jokes-cluster
elif [[ "$1" == "destroy" ]]; then
    kind delete cluster --name jokes-cluster
else
    echo "Wrong Argument, deploy or destroy only"
fi

