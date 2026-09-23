#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l01 — Why Containers: Bare Metal, Machines And Processes
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l01
# © LearnSome.tech
set -u
docker run --rm alpine:3.20 ps -o pid,comm
docker run --rm alpine:3.20 sh -c 'echo hello from inside'
