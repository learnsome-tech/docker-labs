#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m06l02 — Health Checks, Dependencies And Reliable Startup
# https://learnsome.tech/courses/docker-course/watch?lesson=m06l02
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image ls --format '{{.Repository}}:{{.Tag}}'
#   REPOSITORY:TAG
docker ps --format "{{.Names}} {{.Status}}"
#   ...
docker info --format "{{.OSType}}"
#   linux
