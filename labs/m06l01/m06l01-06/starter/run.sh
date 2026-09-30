#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose exec api getent hosts db
docker compose exec db psql -U tasks -tAc 'select user'
docker network ls --filter name=m06l01-stack
docker volume ls --filter name=m06l01-stack
