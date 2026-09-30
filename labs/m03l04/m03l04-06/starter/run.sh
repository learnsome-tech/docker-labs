#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker inspect -f '{{.Config.Volumes}}' postgres:16-alpine
docker create --name m03l04-pg postgres:16-alpine
f='{{range .Mounts}}{{.Type}} {{.Destination}}{{end}}'
docker inspect -f "$f" m03l04-pg
docker rm -v m03l04-pg
