#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l05 — Install Docker And Verify Your Environment
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l05
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run --rm hello-world
#   Hello from Docker!
#   This message shows that your installation appears to be working correctly.
#   ...
#    1. The Docker client contacted the Docker daemon.
#    2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
#   ...
docker run --rm alpine:3.20 uname -m
#   aarch64
