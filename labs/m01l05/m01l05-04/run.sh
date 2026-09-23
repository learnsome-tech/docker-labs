#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l05 — Install Docker And Verify Your Environment
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l05
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm hello-world
docker run --rm alpine:3.20 uname -m
