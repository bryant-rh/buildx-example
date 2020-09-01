#!/bin/bash

export BUILDX_NO_DEFAULT_LOAD=true

mkdir -p ~/.kube
cp /tmp/dockerx/kubeconfig ~/.kube/config

docker buildx create --use --name=buildx --node=buildx --driver=kubernetes --driver-opt="namespace=gitlab"
docker buildx use buildx
docker buildx ls

if [[ ! "${DOCKER_PASSWORD}" ]]; then
  echo "missing env var DOCKER_PASSWORD"
  exit 1
else
  echo "${DOCKER_PASSWORD}" | docker login "${DOCKER_REGISTRY}" -u="${DOCKER_USERNAME}" --password-stdin
fi

