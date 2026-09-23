#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l02 — Run, Stop, Restart And Remove A Container
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l02
# © LearnSome.tech
set -u
docker create --name lifecycle-demo alpine:3.20 sleep 30
docker start lifecycle-demo
docker ps --filter name=lifecycle-demo
