#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l04 — Docker, OCI, The Engine And The CLI
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l04
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker inspect alpine:3.20 -f '{{.Os}} {{.Architecture}}'
docker inspect alpine:3.20 -f '{{.Config.Cmd}}'
