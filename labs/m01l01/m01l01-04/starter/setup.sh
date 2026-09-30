#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker run --rm alpine:3.20 ps -o pid,comm
docker run --rm alpine:3.20 sh -c 'echo hello from inside'
