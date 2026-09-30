#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m04l03-taskapi .
docker run --rm python:3.12-alpine id -un
docker run --rm m04l03-taskapi id
docker run --rm m04l03-taskapi touch /app/x
docker run --rm m04l03-taskapi touch /data/x
docker run --rm --user 0 m04l03-taskapi id -u
docker run --rm m04l03-worker
docker image inspect -f '{{.Config.User}}' m04l03-worker
docker rmi m04l03-taskapi m04l03-worker m04l03-fat m04l03-lean
