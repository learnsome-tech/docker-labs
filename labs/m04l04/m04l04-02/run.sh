#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m04l04 — Scan, Patch And Inspect The Software Supply Chain
# https://learnsome.tech/courses/docker-course/watch?lesson=m04l04
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
