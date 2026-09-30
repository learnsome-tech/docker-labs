#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker rm lifecycle-demo
#   lifecycle-demo
docker image ls alpine:3.20
#   alpine:3.20
