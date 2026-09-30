#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose exec db env | grep POSTGRES | sort
#   POSTGRES_DB=tasks
#   POSTGRES_PASSWORD_FILE=/run/secrets/db_password
#   POSTGRES_USER=tasks
docker inspect m07l03-stack-db-1 | grep -c change-me
#   0
docker compose exec db pg_isready -U tasks -d tasks
#   /var/run/postgresql:5432 - accepting connections
docker compose stop api
#    Container m07l03-stack-api-1 Stopping
#    Container m07l03-stack-api-1 Stopped
docker compose logs api | tail -n 1
#   api-1  | shutting down
docker compose ps -a --format '{{.Service}} {{.Status}}'
#   api Exited (0) Less than a second ago
#   db Up 12 seconds (healthy)
docker compose --progress quiet down -v
