#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l04 — Run The Spine Service And Publish Its Port
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l04
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name taskapi-demo -p 18080:8000 taskapi:0.1
#   ...
curl -s http://localhost:18080/health
#   {"status": "ok"}
docker ps --filter name=taskapi-demo
#   taskapi-demo 0.0.0.0:18080->8000/tcp
