#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
echo 'FROM python:3.12-alpine' > base.Dockerfile
echo 'ONBUILD COPY app.py /app/' >> base.Dockerfile
docker build -q -f base.Dockerfile -t m03l02-base .
docker image inspect -f '{{.Config.OnBuild}}' m03l02-base
echo 'FROM m03l02-base' > child.Dockerfile
docker build -q -f child.Dockerfile -t m03l02-child .
docker run --rm m03l02-child ls /app
