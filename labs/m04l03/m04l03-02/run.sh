#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m04l03 — Minimal Bases, Non Root Users And Smaller Images
# https://learnsome.tech/courses/docker-course/watch?lesson=m04l03
# © LearnSome.tech
set -u
docker image ls --format '{{.Repository}}:{{.Tag}}'
docker ps --format "{{.Names}} {{.Status}}"
docker info --format "{{.OSType}}"
