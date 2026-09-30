#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker version -f '{{.Client.Context}}'
#   desktop-linux
docker version -f '{{.Server.Os}}/{{.Server.Arch}}'
#   linux/arm64
docker info -f '{{.DefaultRuntime}}'
#   runc
docker info -f '{{.Driver}} {{.CgroupVersion}}'
#   overlayfs 2
