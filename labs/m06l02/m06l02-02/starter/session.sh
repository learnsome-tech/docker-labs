#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

ls
#   Dockerfile
#   app.py
#   compose.yaml
#   race.yaml
#   schema.sql
docker compose -f race.yaml run --rm migrate; echo $?
#   ...
#    Container m06l02-race-db-1 Started
#   ...
#   psql: error: connection to server at "db" (172.27.0.2), port 5432 failed: Connection refused
#   ...
#   2
docker compose -f race.yaml down -v
#   ...
#    Network m06l02-race_default Removed
