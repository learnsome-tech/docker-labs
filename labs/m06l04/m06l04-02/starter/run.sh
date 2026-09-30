#!/usr/bin/env bash
set -u
export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose build --quiet
docker compose up -d --wait
docker compose run --rm test; echo $?
