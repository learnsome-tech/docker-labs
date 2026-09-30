#!/usr/bin/env bash
set -u
docker logs taskapi-demo
docker stop taskapi-demo
docker ps -a --filter name=taskapi-demo
