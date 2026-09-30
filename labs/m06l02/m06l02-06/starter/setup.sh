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
