#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m04l02 — Authenticate, Tag, Push And Pull From A Registry
# https://learnsome.tech/courses/docker-course/watch?lesson=m04l02
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
