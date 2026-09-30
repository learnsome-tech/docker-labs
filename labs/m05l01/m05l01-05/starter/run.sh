#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker volume ls --filter name=m05l01
docker volume inspect -f '{{.Mountpoint}}' m05l01-data
docker create --name m05l01-hold -v m05l01-data:/v alpine:3.20
docker ps -a --filter volume=m05l01-data --format '{{.Names}}'
docker volume rm m05l01-data 2>&1 | cut -d'[' -f1
docker rm m05l01-hold
docker volume rm m05l01-data
