#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l05-api . >/dev/null && docker run --rm m03l05-api id
docker run --rm m03l05-api stat -c '%U %n' /app /data
docker run --rm m03l05-api touch /app/x
docker run --rm m03l05-api touch /data/x
docker run --rm -u root m03l05-api id -un
docker build -q -t m03l05-tool -f Dockerfile.tool .
docker run --rm m03l05-tool
docker run --rm m03l05-tool add milk
docker run --rm --entrypoint id m03l05-tool -un
f='{{.Config.Entrypoint}} {{.Config.Cmd}}'
docker inspect -f "$f" m03l05-tool
docker inspect -f "$f" m03l05-api
