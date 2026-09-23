#!/usr/bin/env bash
# Docker Architecture & Production Containers — lesson m01l04 — Docker, OCI, The Engine And The CLI
# https://learnsome.tech/courses/docker-course/watch?lesson=m01l04
# © LearnSome.tech
set -u
docker version -f '{{.Client.Context}}'
docker version -f '{{.Server.Os}}/{{.Server.Arch}}'
docker info -f '{{.DefaultRuntime}}'
docker info -f '{{.Driver}} {{.CgroupVersion}}'
