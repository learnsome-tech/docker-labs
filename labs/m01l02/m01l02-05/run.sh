#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l02 — Namespaces And Cgroups: Isolation And Limits
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l02
# © LearnSome.tech
set -u
bash setup.sh >/dev/null 2>&1
cg=/sys/fs/cgroup
docker run --rm alpine:3.20 cat $cg/memory.max
docker run --rm -m 64m alpine:3.20 cat $cg/memory.max
docker run --rm --cpus=0.5 alpine:3.20 cat $cg/cpu.max
docker run --rm --pids-limit=20 alpine:3.20 cat $cg/pids.max
