#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l06-worker . >/dev/null && docker run --rm -e QUEUE=emails m03l06-worker
