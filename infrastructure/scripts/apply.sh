#!/bin/sh
cd ../OpenTofu
# ls -a

echo "arg: $1"

if [[ "$1" == "stage" ]];
then
    env="stg"
else
    env="$1"
fi

if [[ "$1" == "dev" || "$1" == "stage" || "$1" == "prod" ]]; 
    then
        echo "Apply for environement: $1"
        tofu apply -var-file=tofu.$1.tfvars -auto-approve
    else
        echo "Wrong Argument"
        echo "Pass 'dev', 'stage' or 'prod' only."
fi 