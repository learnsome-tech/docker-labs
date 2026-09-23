#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m05l01 — Ephemeral Filesystems And Named Volumes
# https://learnsome.tech/courses/docker-course/watch?lesson=m05l01
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
