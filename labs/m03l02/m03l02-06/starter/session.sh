#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

echo 'FROM python:3.12-alpine' > base.Dockerfile
echo 'ONBUILD COPY app.py /app/' >> base.Dockerfile
docker build -q -f base.Dockerfile -t m03l02-base .
#   sha256:20c4de37e69287f1fd8969bc2eebaa7c70c552a7216db66118d6deb1a28f4ef4
docker image inspect -f '{{.Config.OnBuild}}' m03l02-base
#   [COPY app.py /app/]
echo 'FROM m03l02-base' > child.Dockerfile
docker build -q -f child.Dockerfile -t m03l02-child .
#   sha256:761e2e3d1188a45a14d8eff868263b71b3566163a4f64da613ea18b5c93ae740
docker run --rm m03l02-child ls /app
#   app.py
