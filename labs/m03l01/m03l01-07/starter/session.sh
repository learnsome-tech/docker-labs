#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m03l01-api:0.1 tmp
#   ERROR: failed to build: failed to solve: failed to read dockerfile: open Dockerfile: no such file or directory
docker build -q -f Dockerfile -t m03l01-api:0.1 tmp
#   Dockerfile:3
#   --------------------
#      1 |     FROM python:3.12-alpine
#      2 |     WORKDIR /app
#      3 | >>> COPY app.py .
#   ...
docker build -q -f Dockerfile -t m03l01-api:0.1 .
#   sha256:ef9baecaa002616d06809746c934758f3bf5e07dbbb861d1b1af8dce57af99ba
