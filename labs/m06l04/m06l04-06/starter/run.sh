#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
export COMPOSE_PROJECT_NAME=m06l04-run-b
docker compose up --exit-code-from test test; echo $?
docker compose ps -a --format '{{.Service}} {{.Status}}'
