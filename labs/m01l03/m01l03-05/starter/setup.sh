#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t layers:demo . >/dev/null && docker image history layers:demo
docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
