#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l01 — Why Containers: Bare Metal, Machines And Processes
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l01
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm alpine:3.20 ps -o pid,comm
#   PID   COMMAND
#       1 ps
docker run --rm alpine:3.20 sh -c 'echo hello from inside'
#   hello from inside
