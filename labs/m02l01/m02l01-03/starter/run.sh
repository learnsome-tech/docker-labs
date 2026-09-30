#!/usr/bin/env bash
set -u
docker image inspect alpine:3.20 --format '{{.Os}}'
docker image inspect alpine:3.20 --format '{{.Config.Cmd}}'
docker image history alpine:3.20
