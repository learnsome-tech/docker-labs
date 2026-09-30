#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker version -f '{{.Client.Context}}'
docker version -f '{{.Server.Os}}/{{.Server.Arch}}'
docker info -f '{{.DefaultRuntime}}'
docker info -f '{{.Driver}} {{.CgroupVersion}}'
