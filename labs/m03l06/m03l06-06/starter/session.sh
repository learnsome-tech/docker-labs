#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm m03l06-safe cat /status.txt
#   token received
docker history --no-trunc m03l06-leak | grep -c s3cret
#   2
docker history --no-trunc m03l06-safe | grep -c s3cret
#   0
docker run --rm m03l06-safe ls /run/secrets
#   ls: /run/secrets: No such file or directory
