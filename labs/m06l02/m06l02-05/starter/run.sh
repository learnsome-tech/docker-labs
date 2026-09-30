#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose build --quiet
docker compose up -d --wait
docker compose ps -a --format '{{.Service}} {{.Status}}'
docker compose exec db psql -U tasks -c '\dt'
docker inspect -f '{{.State.Health.Status}}' m06l02-stack-db-1
