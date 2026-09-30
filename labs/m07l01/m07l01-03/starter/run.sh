#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker run -d --name m07l01-api m07l01-api
docker run -d --name m07l01-idle alpine:3.22 sleep 300
docker run -d --init --name m07l01-init alpine:3.22 sleep 300
docker stop m07l01-api m07l01-init
docker stop -t 2 m07l01-idle
docker ps -a -f name=m07l01 --format '{{.Names}} {{.Status}}'
docker logs m07l01-api
docker rm m07l01-api m07l01-idle m07l01-init
