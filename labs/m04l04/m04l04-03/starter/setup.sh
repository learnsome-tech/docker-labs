#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m04l04-taskapi:1 .
docker run --rm m04l04-taskapi:1 cat /etc/alpine-release
docker scout sbom --format list m04l04-taskapi:1 2>/dev/null
