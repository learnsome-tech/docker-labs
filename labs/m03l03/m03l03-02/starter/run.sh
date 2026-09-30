#!/usr/bin/env bash
set -u
docker build -q -t m03l03-api . && docker history --format '{{.CreatedBy}}' m03l03-api
