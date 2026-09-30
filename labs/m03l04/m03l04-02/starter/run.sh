#!/usr/bin/env bash
set -u
docker build -q --build-arg APP_VERSION=1.1.0 -t m03l04-api . && docker run --rm m03l04-api env
