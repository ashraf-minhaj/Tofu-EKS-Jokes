#!/bin/sh
echo "arg: $1"

cd ../OpenTofu
ls -a

if [[ "$1" == "dev" || "$1" == "stage" || "$1" == "prod" ]]; 
    then
        echo "Planning for environement: $1"
        tofu plan -var-file=tofu.$1.tfvars
    else
        echo "Wrong Argument"
        echo "Pass 'dev', 'stage' or 'prod' only."
fi 