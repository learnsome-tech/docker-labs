#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m07l04-api:1.0.0 . >/dev/null
docker save -o api.tar m07l04-api:1.0.0
tar -tf api.tar | grep -v '^blobs/sha256/.'
tar -xOf api.tar oci-layout; echo
docker info -f '{{.DefaultRuntime}} {{.Containerd.Address}}'
f='{{.Config.User}} {{.Config.ExposedPorts}}'
docker inspect -f "$f" m07l04-api:1.0.0
rm api.tar
