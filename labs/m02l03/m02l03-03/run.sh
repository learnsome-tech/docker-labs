#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l03 — Commands, Logs, Exec And Exit Codes
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l03
# © LearnSome.tech
set -u
docker exec command-demo ps
docker exec command-demo true
docker top command-demo
