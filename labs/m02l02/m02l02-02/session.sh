#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l02 — Run, Stop, Restart And Remove A Container
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l02
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker create --name lifecycle-demo alpine:3.20 sleep 30
#   ...
docker start lifecycle-demo
#   lifecycle-demo
docker ps --filter name=lifecycle-demo
#   CONTAINER ID   IMAGE         COMMAND       CREATED        STATUS        NAMES
#   ...           alpine:3.20  "sh -c ..."  ...            Up ...        lifecycle-demo
