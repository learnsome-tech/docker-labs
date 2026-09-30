#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t layers:demo . >/dev/null && docker image history layers:demo
