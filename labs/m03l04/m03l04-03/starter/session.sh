#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker image inspect -f '{{json .Config.Labels}}' m03l04-api
#   {"org.opencontainers.image.title":"taskapi","org.opencontainers.image.version":"1.1.0"}
docker image inspect -f '{{.Config.ExposedPorts}}' m03l04-api
#   map[8000/tcp:{}]
docker history m03l04-api | grep ARG
#   <missing>      2 weeks ago    ARG APP_VERSION=1.1.0                           0B        buildkit.dockerfile.v0
docker run --rm m03l04-api printenv PYTHON_TAG
docker run --rm -e PORT=9000 m03l04-api printenv PORT
#   9000
