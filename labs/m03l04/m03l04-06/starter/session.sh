#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker inspect -f '{{.Config.Volumes}}' postgres:16-alpine
#   map[/var/lib/postgresql/data:{}]
docker create --name m03l04-pg postgres:16-alpine
#   0583bbaae7773943466bc1a477e9f5aa5e0b9571b9540789cdd35440434d0631
f='{{range .Mounts}}{{.Type}} {{.Destination}}{{end}}'
docker inspect -f "$f" m03l04-pg
#   volume /var/lib/postgresql/data
docker rm -v m03l04-pg
#   m03l04-pg
