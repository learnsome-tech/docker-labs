#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m04l02 — Authenticate, Tag, Push And Pull From A Registry
# https://learnsome.tech/courses/docker-course/watch?lesson=m04l02
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
