#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose down
#    Container m06l01-stack-api-1 Stopping
#    Container m06l01-stack-api-1 Stopped
#   ...
#    Network m06l01-stack_default Removed
docker volume ls -q --filter name=m06l01-stack
#   m06l01-stack_db-data
#   m06l01-stack_task-data
docker compose up -d --wait
#   ...
#    Container m06l01-stack-api-1 Healthy
curl -s localhost:18601/tasks -w '\n'
#   {"tasks": ["ship it"]}
docker compose down -v
#   ...
#    Volume m06l01-stack_db-data Removed
docker image rm taskapi:m06l01
#   Untagged: taskapi:m06l01
#   Deleted: sha256:1a1e4566d104db5ac7f27e010d1be3f5ea5aa3fcda8edc0da546db7fbc2da78e
