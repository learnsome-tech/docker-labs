#!/usr/bin/env bash
set -u
docker build -q -t m03l05-api . >/dev/null && docker run --rm m03l05-api id
