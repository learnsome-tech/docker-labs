#!/usr/bin/env bash
set -u
docker run -d --name command-demo alpine:3.20 sleep 20
docker logs command-demo
docker inspect command-demo --format '{{.State.Status}}'
