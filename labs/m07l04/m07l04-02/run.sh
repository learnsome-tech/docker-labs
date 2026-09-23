#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m07l04 — From Local Containers To Kubernetes
# https://learnsome.tech/courses/docker-course/watch?lesson=m07l04
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
