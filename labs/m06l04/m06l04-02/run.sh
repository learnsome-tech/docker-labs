#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m06l04 — Integration Tests, Test Data And Compose Cleanup
# https://learnsome.tech/courses/docker-course/watch?lesson=m06l04
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
