#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

F='{{.Repository}}:{{.Tag}} {{.Size}}'
docker images --format "$F" debian:13
#   debian:13 209MB
docker images --format "$F" python:3.12-alpine
#   python:3.12-alpine 88.4MB
docker images --format "$F" alpine:3.22
#   alpine:3.22 13.4MB
docker images --format "$F" busybox:1.37
#   busybox:1.37 6.14MB
docker images --format "$F" gcr.io/distroless/static-debian12
#   gcr.io/distroless/static-debian12:latest 6.18MB
docker run --rm debian:13 sh -c 'ls /usr/bin | wc -l'
#   257
docker run --rm alpine:3.22 sh -c 'ls /usr/bin | wc -l'
#   143
