#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l05-api . >/dev/null && docker run --rm m03l05-api id
