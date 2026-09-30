#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m03l05-tool -f Dockerfile.tool .
#   sha256:315c7a9fd21a18d3869fb8abe847784e4ff313c903e365ae91088bbbca76a78e
docker run --rm m03l05-tool
#   task: list
docker run --rm m03l05-tool add milk
#   task: add milk
docker run --rm --entrypoint id m03l05-tool -un
#   root
f='{{.Config.Entrypoint}} {{.Config.Cmd}}'
docker inspect -f "$f" m03l05-tool
#   [echo task:] [list]
docker inspect -f "$f" m03l05-api
#   [] [python app.py]
