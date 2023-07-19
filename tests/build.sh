#!/usr/bin/env bash

RELEASE=$(git describe --abbrev=0 --tags)

sed -i "s~ARG TARGETARCH~ARG TARGETARCH amd64~g" Dockerfile.release

sed -i "s~ARG RELEASE~ARG RELEASE ${RELEASE}~g" Dockerfile.release

docker buildx build . -f Dockerfile.release --output type=docker,name=elestio4test/minio:latest | docker load