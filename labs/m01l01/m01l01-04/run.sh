#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l01 — Why Containers: Bare Metal, Machines And Processes
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l01
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
docker run --rm alpine:3.20 uname -o
docker run --rm alpine:3.20 grep ^NAME= /etc/os-release
docker run --rm debian:13 grep ^NAME= /etc/os-release
