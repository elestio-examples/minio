#!/usr/bin/env bash


sed -i 's/^.*MINIO_SERVER_URL.*$/# &/' docker-compose.yml
docker-compose up -d;
sleep 30s;

