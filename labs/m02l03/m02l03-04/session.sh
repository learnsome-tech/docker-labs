#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l03 — Commands, Logs, Exec And Exit Codes
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l03
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --name exit-demo alpine:3.20 false; echo code:0$?
#   code:7
docker inspect exit-demo --format '{{.State.ExitCode}}'
#   7 exited
docker rm exit-demo
#   exit-demo
