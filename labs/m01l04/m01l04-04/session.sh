#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l04 — Docker, OCI, The Engine And The CLI
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l04
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker inspect alpine:3.20 -f '{{.Os}} {{.Architecture}}'
#   linux arm64
docker inspect alpine:3.20 -f '{{.Config.Cmd}}'
#   [/bin/sh]
