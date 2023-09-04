#!/usr/bin/env bash

rm -rf ./Dockerfile

mv ./Dockerfile.release Dockerfile

RELEASE=$(git describe --abbrev=0 --tags)

sed -i "s~ARG TARGETARCH~ARG TARGETARCH=amd64~g" Dockerfile

sed -i "s~ARG RELEASE~ARG RELEASE=${RELEASE}~g" Dockerfile

docker buildx build . --output type=docker,name=elestio4test/minio:latest | docker load
