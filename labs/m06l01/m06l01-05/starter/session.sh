#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose build --quiet
#    Image taskapi:m06l01 Building
#    Image taskapi:m06l01 Built
docker compose up -d --wait
#   ...
#    Container m06l01-stack-api-1 Healthy
docker compose ps --format '{{.Service}} {{.Status}}'
#   api Up 3 seconds (healthy)
#   db Up 3 seconds
curl -s localhost:18601/health -w '\n'
#   {"status": "ok", "version": "1.1.0"}
curl -s -d '{"title":"ship it"}' localhost:18601/tasks -w '\n'
#   {"tasks": ["ship it"]}
docker compose logs api
#   api-1  | listening on port 8000
#   ...
#   api-1  | POST /tasks
