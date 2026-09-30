#!/usr/bin/env bash
set -u
docker build -q -t m03l01-api:0.1 . && docker run --rm m03l01-api:0.1 sh -c 'pwd; ls -A'
