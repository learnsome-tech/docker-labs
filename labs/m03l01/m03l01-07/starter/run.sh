#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker build -q -t m03l01-api:0.1 tmp
docker build -q -f Dockerfile -t m03l01-api:0.1 tmp
docker build -q -f Dockerfile -t m03l01-api:0.1 .
