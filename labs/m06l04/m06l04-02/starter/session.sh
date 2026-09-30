#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

export COMPOSE_PROJECT_NAME=m06l04-run-a
docker compose build --quiet
#    Image taskapi:m06l04 Building
#    Image taskapi:m06l04 Built
docker compose up -d --wait
#   ...
#    Container m06l04-run-a-api-1 Healthy
docker compose run --rm test; echo $?
#   ...
#   health endpoint answers
#   a posted task is listed
#   database holds exactly the seed rows
#   all checks passed
#   0
