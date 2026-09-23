#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l01 — Pull And Inspect A Third Party Image
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l01
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image inspect alpine:3.20 --format '{{.Os}}'
#   linux arm64
docker image inspect alpine:3.20 --format '{{.Config.Cmd}}'
#   ["/bin/sh"]
docker image history alpine:3.20
#   IMAGE        CREATED       CREATED BY   SIZE      COMMENT
#   ...
