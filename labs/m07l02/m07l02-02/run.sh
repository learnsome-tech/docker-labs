#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m07l02 — Build, Test And Promote The Same Image In CI
# https://learnsome.tech/courses/docker-course/watch?lesson=m07l02
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
