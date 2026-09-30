#!/usr/bin/env bash
set -u
docker build -q -t m03l06-worker . >/dev/null && docker run --rm -e QUEUE=emails m03l06-worker
