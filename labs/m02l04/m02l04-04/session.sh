#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l04 — Run The Spine Service And Publish Its Port
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l04
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker logs taskapi-demo
#   ...
#   GET /health 200
docker stop taskapi-demo
#   taskapi-demo
docker ps -a --filter name=taskapi-demo
#   taskapi-demo Exited (0) ... ago
