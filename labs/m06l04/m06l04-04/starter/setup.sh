#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose build --quiet
docker compose up -d --wait
docker compose run --rm test; echo $?
