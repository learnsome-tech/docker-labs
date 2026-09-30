#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose config --services
#   db
#   api
docker compose --profile tools config --services | sort
#   api
#   db
#   dbshell
docker compose run --rm dbshell -tAc 'select 42'
#   ...
#   42
mv app.py.bak app.py
docker compose down -v
#   ...
#    Network m06l03-stack_default Removed
docker image rm taskapi:m06l03
#   Untagged: taskapi:m06l03
#   Deleted: sha256:9b1f4d2e6a7c3b8f0e5d4c3b2a1f0e9d8c7b6a5f4e3d2c1b0a9f8e7d6c5b4a3f
