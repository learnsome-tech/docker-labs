#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l01 — Pull And Inspect A Third Party Image
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l01
# © LearnSome.tech
set -u
docker image inspect alpine:3.20 --format '{{.Os}}'
docker image inspect alpine:3.20 --format '{{.Config.Cmd}}'
docker image history alpine:3.20
