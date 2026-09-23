#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m06l01 — Define The Service And Database With Compose
# https://learnsome.tech/courses/docker-course/watch?lesson=m06l01
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
