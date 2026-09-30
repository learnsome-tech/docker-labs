#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l01-api:0.1 . && docker run --rm m03l01-api:0.1 sh -c 'pwd; ls -A'
