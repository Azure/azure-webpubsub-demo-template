#!/bin/bash

HUB_NAME_PREFIX="sample_"
RESOURCE_GROUP_PREFIX="awps-live-demo-"

VALID_ARGS=$(getopt -o d:u:l:s: --long demo-name:unit-count:location:subscription -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1
fi

eval set -- "$VALID_ARGS"
while [ : ]; do
    case "$1" in
    -d | --demo-name)
        demo=$2
        shift 2
        ;;
    -u | --unit-count)
        unit=$2
        shift 2
        ;;
    -l | --location)
        location=$2
        shift 2
        ;;
    -s | --subscription)
        subscription=$2
        shift 2
        ;;
    --)
        shift
        break
        ;;
    esac
done

name=$RESOURCE_GROUP_PREFIX$demo
hub=$HUB_NAME_PREFIX$demo

echo "Use name: '$name' to create resources"

# setup account
az login
az account set -s $subscription

# create resource group
az group create -g $name -l $location

# add lock to resource group
az group lock create -t CanNotDelete -n CanNotDelete -g $name

# create web pubsub service
az webpubsub create -n $name -g $name --sku Standard_S1 --unit-count $unit -l $location

echo "############################################################################################"
echo "# Created a resource group with delete lock: $name"
echo "# Created a web pubsub service: $name"
echo "# Please use '$HUB_NAME_PREFIX' as prefix of hub name. e.g. '$hub'"
echo "############################################################################################"
