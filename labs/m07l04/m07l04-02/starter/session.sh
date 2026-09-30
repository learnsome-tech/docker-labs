#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m07l04-api:1.0.0 . >/dev/null
docker save -o api.tar m07l04-api:1.0.0
tar -tf api.tar | grep -v '^blobs/sha256/.'
#   blobs/
#   blobs/sha256/
#   index.json
#   manifest.json
#   oci-layout
tar -xOf api.tar oci-layout; echo
#   {"imageLayoutVersion":"1.0.0"}
docker info -f '{{.DefaultRuntime}} {{.Containerd.Address}}'
#   runc /run/containerd/containerd.sock
f='{{.Config.User}} {{.Config.ExposedPorts}}'
docker inspect -f "$f" m07l04-api:1.0.0
#   app map[8000/tcp:{}]
rm api.tar
