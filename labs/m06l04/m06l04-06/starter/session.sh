#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

export COMPOSE_PROJECT_NAME=m06l04-run-b
docker compose up --exit-code-from test test; echo $?
#   ...
#   test-1  | all checks passed
#   ...
#   0
docker compose ps -a --format '{{.Service}} {{.Status}}'
#   api Up 4 seconds (healthy)
#   db Up 6 seconds (healthy)
#   test Exited (0) Less than a second ago
