#!/usr/bin/env bash
set -u
docker build -q -t layers:demo . >/dev/null && docker image history layers:demo
