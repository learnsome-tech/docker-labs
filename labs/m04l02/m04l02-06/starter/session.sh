#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

export DOCKER_CONFIG=/tmp/m04l02-client
docker login localhost:18402 -u ci-bot --password-stdin <token
#   Login Succeeded
jq . $DOCKER_CONFIG/config.json
#   {
#     "auths": {
#       "localhost:18402": {}
#     },
#     "credsStore": "osxkeychain"
#   }
docker push -q localhost:18402/taskapi:1.0.0
#   localhost:18402/taskapi:1.0.0
docker logout localhost:18402
#   Removing login credentials for localhost:18402
docker rm -f m04l02-registry
#   m04l02-registry
docker rmi localhost:18402/taskapi:1.0.0
#   Untagged: localhost:18402/taskapi:1.0.0
#   Untagged: localhost:18402/taskapi@sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
#   Deleted: sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
rm -rf $DOCKER_CONFIG
