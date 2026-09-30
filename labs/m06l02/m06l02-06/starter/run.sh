#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
HC='--health-cmd false --health-interval 1s'
docker run -d --name m06l02-sick $HC busybox:1.37 sleep 60
sleep 5
docker ps -f name=m06l02-sick --format '{{.Status}}'
docker rm -f m06l02-sick
docker compose down -v
docker image rm taskapi:m06l02
