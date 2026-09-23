#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m05l01 — Ephemeral Filesystems And Named Volumes
# https://learnsome.tech/courses/docker-course/watch?lesson=m05l01
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
