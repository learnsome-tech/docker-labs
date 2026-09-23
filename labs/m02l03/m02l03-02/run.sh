#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l03 — Commands, Logs, Exec And Exit Codes
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l03
# © LearnSome.tech
set -u
docker run -d --name command-demo alpine:3.20 sleep 20
docker logs command-demo
docker inspect command-demo --format '{{.State.Status}}'
