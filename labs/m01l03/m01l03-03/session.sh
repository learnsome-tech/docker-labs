#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l03 — Union Filesystems, Images And Writable Layers
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l03
# © LearnSome.tech
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
#   3
docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
#   layers
