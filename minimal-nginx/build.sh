#!/usr/bin/env bash
CURPATH=$(cd $(dirname $0); pwd)
IMAGE_VERSION=`cat $CURPATH/Dockerfile | grep -E '^ENV\s+NGINX_VERSION' | awk '{print $3}'`
IMAGE_NAME="oddpoet/minimal-nginx"

echo "Build Docker Image : $IMAGE_NAME:$IMAGE_VERSION"
cd $CURPATH
docker build \
  -t $IMAGE_NAME:$IMAGE_VERSION \
  -t $IMAGE_NAME:latest \
  .
