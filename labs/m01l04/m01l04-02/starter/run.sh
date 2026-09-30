#!/usr/bin/env bash
set -u
docker version -f '{{.Client.Context}}'
docker version -f '{{.Server.Os}}/{{.Server.Arch}}'
docker info -f '{{.DefaultRuntime}}'
docker info -f '{{.Driver}} {{.CgroupVersion}}'
