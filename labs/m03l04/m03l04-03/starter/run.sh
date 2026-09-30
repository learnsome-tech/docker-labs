#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker image inspect -f '{{json .Config.Labels}}' m03l04-api
docker image inspect -f '{{.Config.ExposedPorts}}' m03l04-api
docker history m03l04-api | grep ARG
docker run --rm m03l04-api printenv PYTHON_TAG
docker run --rm -e PORT=9000 m03l04-api printenv PORT
