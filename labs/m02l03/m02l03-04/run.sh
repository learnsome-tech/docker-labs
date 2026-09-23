#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l03 — Commands, Logs, Exec And Exit Codes
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l03
# © LearnSome.tech
set -u
docker run --name exit-demo alpine:3.20 false; echo code:0$?
docker inspect exit-demo --format '{{.State.ExitCode}}'
docker rm exit-demo
