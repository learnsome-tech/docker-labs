#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose exec db env | grep POSTGRES | sort
docker inspect m07l03-stack-db-1 | grep -c change-me
docker compose exec db pg_isready -U tasks -d tasks
docker compose stop api
docker compose logs api | tail -n 1
docker compose ps -a --format '{{.Service}} {{.Status}}'
docker compose --progress quiet down -v
