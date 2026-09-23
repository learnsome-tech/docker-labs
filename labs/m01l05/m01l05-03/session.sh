#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l05 — Install Docker And Verify Your Environment
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l05
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker version
#   Client:
#   ...
#    Context:           desktop-linux
#   ...
#    Engine:
#   ...
#     OS/Arch:          linux/arm64
#   ...
docker compose version
#   Docker Compose version v5.5.1
