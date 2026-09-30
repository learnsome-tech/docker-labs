#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker image inspect layers:demo -f '{{len .RootFS.Layers}}'
docker image inspect alpine:3.20 -f '{{.RootFS.Type}}'
