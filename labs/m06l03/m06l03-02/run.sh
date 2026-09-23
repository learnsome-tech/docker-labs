#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m06l03 — Development Overrides, Hot Reloading And Debuggers
# https://learnsome.tech/courses/docker-course/watch?lesson=m06l03
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
