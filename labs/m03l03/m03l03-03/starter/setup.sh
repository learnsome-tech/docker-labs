#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l03-api . && docker history --format '{{.CreatedBy}}' m03l03-api
