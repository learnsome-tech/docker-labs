#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m03l05-tool -f Dockerfile.tool .
docker run --rm m03l05-tool
docker run --rm m03l05-tool add milk
docker run --rm --entrypoint id m03l05-tool -un
f='{{.Config.Entrypoint}} {{.Config.Cmd}}'
docker inspect -f "$f" m03l05-tool
docker inspect -f "$f" m03l05-api
