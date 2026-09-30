#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker inspect alpine:3.20 -f '{{.Os}} {{.Architecture}}'
docker inspect alpine:3.20 -f '{{.Config.Cmd}}'
