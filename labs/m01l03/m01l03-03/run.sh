#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l03 — Union Filesystems, Images And Writable Layers
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l03
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
