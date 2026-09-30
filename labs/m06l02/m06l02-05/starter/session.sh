#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose build --quiet
#    Image taskapi:m06l02 Building
#    Image taskapi:m06l02 Built
docker compose up -d --wait
#   ...
#    Container m06l02-stack-migrate-1 Exited
#   ...
#    Container m06l02-stack-api-1 Healthy
docker compose ps -a --format '{{.Service}} {{.Status}}'
#   api Up 3 seconds (healthy)
#   db Up 6 seconds (healthy)
#   migrate Exited (0) 4 seconds ago
docker compose exec db psql -U tasks -c '\dt'
#          List of relations
#    Schema | Name  | Type  | Owner 
#   --------+-------+-------+-------
#    public | tasks | table | tasks
#   (1 row)
docker inspect -f '{{.State.Health.Status}}' m06l02-stack-db-1
#   healthy
