#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q --build-arg APP_VERSION=1.1.0 -t m03l04-api . && docker run --rm m03l04-api env
docker image inspect -f '{{json .Config.Labels}}' m03l04-api
docker image inspect -f '{{.Config.ExposedPorts}}' m03l04-api
docker history m03l04-api | grep ARG
docker run --rm m03l04-api printenv PYTHON_TAG
docker run --rm -e PORT=9000 m03l04-api printenv PORT
docker run -d --name m03l04-web -p 18304:8000 m03l04-api
sleep 1; curl -s localhost:18304/health; echo
docker port m03l04-web
docker rm -f m03l04-web
