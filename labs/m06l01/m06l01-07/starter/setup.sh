#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
ls
docker compose config --services
docker compose config --images | sort
docker compose build --quiet
docker compose up -d --wait
docker compose ps --format '{{.Service}} {{.Status}}'
curl -s localhost:18601/health -w '\n'
curl -s -d '{"title":"ship it"}' localhost:18601/tasks -w '\n'
docker compose logs api
docker compose exec api getent hosts db
docker compose exec db psql -U tasks -tAc 'select user'
docker network ls --filter name=m06l01-stack
docker volume ls --filter name=m06l01-stack
