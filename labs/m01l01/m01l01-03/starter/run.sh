#!/usr/bin/env bash
set -u
docker run --rm alpine:3.20 ps -o pid,comm
docker run --rm alpine:3.20 sh -c 'echo hello from inside'
