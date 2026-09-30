#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker compose down
docker volume ls -q --filter name=m06l01-stack
docker compose up -d --wait
curl -s localhost:18601/tasks -w '\n'
docker compose down -v
docker image rm taskapi:m06l01
