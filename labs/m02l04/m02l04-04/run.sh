#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m02l04 — Run The Spine Service And Publish Its Port
# https://learnsome.tech/courses/docker-course/watch?lesson=m02l04
# © LearnSome.tech
set -u
docker logs taskapi-demo
docker stop taskapi-demo
docker ps -a --filter name=taskapi-demo
