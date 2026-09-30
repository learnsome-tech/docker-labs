#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose exec api getent hosts db
#   172.27.0.2        db  db
docker compose exec db psql -U tasks -tAc 'select user'
#   tasks
docker network ls --filter name=m06l01-stack
#   NETWORK ID     NAME                   DRIVER    SCOPE
#   3f1c2a9d8e7b   m06l01-stack_default   bridge    local
docker volume ls --filter name=m06l01-stack
#   DRIVER    VOLUME NAME
#   local     m06l01-stack_db-data
#   local     m06l01-stack_task-data
