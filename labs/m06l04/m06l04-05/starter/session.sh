#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose exec db psql -U tasks -tAc 'table tasks'
#   1|seeded one
#   2|seeded two
docker compose exec -T db psql -U tasks < extra.sql
#   INSERT 0 1
docker compose run --rm test; echo $?
#   ...
#   database holds exactly the seed rows
#   1
