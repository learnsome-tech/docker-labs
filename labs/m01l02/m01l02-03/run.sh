#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l02 — Namespaces And Cgroups: Isolation And Limits
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l02
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm alpine:3.20 ps -o comm
docker run --rm --pid=host alpine:3.20 ps -o comm|sed -n 2,4p
docker run --rm --uts=host alpine:3.20 hostname
