#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker build -q -t m04l02-taskapi:1.0.0 .
#   sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
docker run -d --name m04l02-registry -p 18402:5000 registry:3
#   049f4cae2d93fc099c623c3d2177dba2f6d8ff741e2a6bae5d394ec32c0a76f0
docker tag m04l02-taskapi:1.0.0 localhost:18402/taskapi:1.0.0
docker push localhost:18402/taskapi:1.0.0
#   The push refers to repository [localhost:18402/taskapi]
#   ...
#   1.0.0: digest: sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598 size: 856
curl -s localhost:18402/v2/_catalog
#   {"repositories":["taskapi"]}
curl -s localhost:18402/v2/taskapi/tags/list
#   {"name":"taskapi","tags":["1.0.0"]}
