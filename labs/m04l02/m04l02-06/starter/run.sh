#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
export DOCKER_CONFIG=/tmp/m04l02-client
docker login localhost:18402 -u ci-bot --password-stdin <token
jq . $DOCKER_CONFIG/config.json
docker push -q localhost:18402/taskapi:1.0.0
docker logout localhost:18402
docker rm -f m04l02-registry
docker rmi localhost:18402/taskapi:1.0.0
rm -rf $DOCKER_CONFIG
