#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l03-api . && docker history --format '{{.CreatedBy}}' m03l03-api
docker build -q -f forms.Dockerfile -t m03l03-forms . && docker run --rm m03l03-forms ls
docker build -q -f pipe.Dockerfile -t m03l03-pipe .
export BUILDKIT_PROGRESS=plain
b() { docker build -t m03l03-api . 2>&1; }
b | grep -c CACHED
touch app.py && b | grep -c CACHED
echo "# $(date)" >> app.py
b | grep -B1 DONE | grep -o '\[./5].*'
b | grep -c CACHED
