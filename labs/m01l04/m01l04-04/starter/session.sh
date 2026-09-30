#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker inspect alpine:3.20 -f '{{.Os}} {{.Architecture}}'
#   linux arm64
docker inspect alpine:3.20 -f '{{.Config.Cmd}}'
#   [/bin/sh]
