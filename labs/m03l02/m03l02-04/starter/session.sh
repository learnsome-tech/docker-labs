#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' app.py
#   0:0 644 app.py
docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' private.py
#   10001:10001 600 private.py
docker run --rm m03l02-api:1 pwd
#   /opt/tasks
