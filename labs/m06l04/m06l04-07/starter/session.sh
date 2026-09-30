#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker compose ls -a -q --filter name=m06l04
#   m06l04-run-a
#   m06l04-run-b
docker compose -p m06l04-run-a down -v
#   ...
#    Volume m06l04-run-a_task-data Removed
docker compose -p m06l04-run-b down -v
#   ...
#    Volume m06l04-run-b_task-data Removed
docker compose ls -a -q --filter name=m06l04
docker image rm taskapi:m06l04
#   Untagged: taskapi:m06l04
#   Deleted: sha256:120d31eae9ac72666040cca0c56e636df17fb92bb69894c6c58e2ff9649c00ae
