#!/bin/bash


SOURCE=$1
DEST=$2
REGION=$3
ACCOUNT_ID=$4

docker pull $SOURCE 
docker tag $SOURCE $DEST
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
docker push $DEST