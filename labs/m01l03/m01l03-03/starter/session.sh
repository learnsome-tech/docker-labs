#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
#   3
docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
#   layers
