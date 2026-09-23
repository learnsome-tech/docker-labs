#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m04l01 — Tags, Digests And Reproducible Image References
# https://learnsome.tech/courses/docker-course/watch?lesson=m04l01
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
