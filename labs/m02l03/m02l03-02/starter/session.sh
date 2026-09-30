#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name command-demo alpine:3.20 sleep 20
#   ...
docker logs command-demo
#   ready
docker inspect command-demo --format '{{.State.Status}}'
#   running true
