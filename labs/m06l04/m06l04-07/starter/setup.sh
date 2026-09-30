#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose build --quiet
docker compose up -d --wait
docker compose run --rm test; echo $?
export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose exec db psql -U tasks -tAc 'table tasks'
docker compose exec -T db psql -U tasks < extra.sql
docker compose run --rm test; echo $?
export COMPOSE_PROJECT_NAME=m06l04-run-b
docker compose up --exit-code-from test test; echo $?
docker compose ps -a --format '{{.Service}} {{.Status}}'
