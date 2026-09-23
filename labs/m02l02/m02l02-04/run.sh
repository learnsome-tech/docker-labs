#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l02 — Run, Stop, Restart And Remove A Container
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l02
# © LearnSome.tech
set -u
docker rm lifecycle-demo
docker image ls alpine:3.20
