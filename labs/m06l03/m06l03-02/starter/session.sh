#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

ls
#   Dockerfile
#   app.py
#   compose.override.yaml
#   compose.yaml
docker compose -f compose.yaml config | grep APP_VERSION
#         APP_VERSION: 1.1.0
docker compose config | grep -E 'VERSION|host_ip|published'
#         APP_VERSION: dev
#           host_ip: 127.0.0.1
#           published: "18603"
