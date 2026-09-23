#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l02 — Run, Stop, Restart And Remove A Container
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l02
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker stop lifecycle-demo
#   lifecycle-demo
docker ps -a --filter name=lifecycle-demo
#   lifecycle-demo Exited (0) ... ago
docker start -a lifecycle-demo
#   
