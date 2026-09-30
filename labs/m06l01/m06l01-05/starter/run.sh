#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose build --quiet
docker compose up -d --wait
docker compose ps --format '{{.Service}} {{.Status}}'
curl -s localhost:18601/health -w '\n'
curl -s -d '{"title":"ship it"}' localhost:18601/tasks -w '\n'
docker compose logs api
