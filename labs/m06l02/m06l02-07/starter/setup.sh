#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
ls
docker compose -f race.yaml run --rm migrate; echo $?
docker compose -f race.yaml down -v
docker compose build --quiet
docker compose up -d --wait
docker compose ps -a --format '{{.Service}} {{.Status}}'
docker compose exec db psql -U tasks -c '\dt'
docker inspect -f '{{.State.Health.Status}}' m06l02-stack-db-1
HC='--health-cmd false --health-interval 1s'
docker run -d --name m06l02-sick $HC busybox:1.37 sleep 60
sleep 5
docker ps -f name=m06l02-sick --format '{{.Status}}'
docker rm -f m06l02-sick
docker compose down -v
docker image rm taskapi:m06l02
