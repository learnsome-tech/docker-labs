#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m03l03-api . && docker history --format '{{.CreatedBy}}' m03l03-api
docker build -q -f forms.Dockerfile -t m03l03-forms . && docker run --rm m03l03-forms ls
docker build -q -f pipe.Dockerfile -t m03l03-pipe .
