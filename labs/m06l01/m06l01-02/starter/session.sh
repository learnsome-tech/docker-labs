#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

ls
#   Dockerfile
#   app.py
#   compose.yaml
docker compose config --services
#   db
#   api
docker compose config --images | sort
#   postgres:16-alpine
#   taskapi:m06l01
