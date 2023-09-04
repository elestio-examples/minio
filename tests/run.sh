#!/usr/bin/env bash


sed -i 's/^.*MINIO_SERVER_URL.*$/# &/' docker-compose.yml
docker-compose up -d;
sed -i 's/^#\(.*MINIO_SERVER_URL.*\)$/\1/' docker-compose.yml
sleep 30s;
