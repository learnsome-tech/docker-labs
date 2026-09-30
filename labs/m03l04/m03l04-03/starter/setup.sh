#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q --build-arg APP_VERSION=1.1.0 -t m03l04-api . && docker run --rm m03l04-api env
