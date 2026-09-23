#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m05l03 — Bridge Networks, DNS And Container Communication
# https://learnsome.tech/courses/docker-course/watch?lesson=m05l03
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
