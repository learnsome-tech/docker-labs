#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose exec db psql -U tasks -tAc 'table tasks'
docker compose exec -T db psql -U tasks < extra.sql
docker compose run --rm test; echo $?
