#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l01 — Pull And Inspect A Third Party Image
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l01
# © LearnSome.tech
set -u
docker pull alpine:3.20
docker image ls alpine:3.20
