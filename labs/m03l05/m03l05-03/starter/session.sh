#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm m03l05-api stat -c '%U %n' /app /data
#   root /app
#   app /data
docker run --rm m03l05-api touch /app/x
#   touch: /app/x: Permission denied
docker run --rm m03l05-api touch /data/x
docker run --rm -u root m03l05-api id -un
#   root
