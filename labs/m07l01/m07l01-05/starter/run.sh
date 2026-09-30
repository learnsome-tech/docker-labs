#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
opts="-m 64m --health-interval 1s --health-retries 2"
docker run -d --name m07l01-sick -e PORT=9000 $opts m07l01-api
sleep 4
docker ps -f name=m07l01-sick --format '{{.Status}}'
f='{{(index .State.Health.Log 0).Output}}'
docker inspect -f "$f" m07l01-sick
docker logs m07l01-sick
docker stats --no-stream --format '{{.MemUsage}}' m07l01-sick
docker rm -f m07l01-sick
