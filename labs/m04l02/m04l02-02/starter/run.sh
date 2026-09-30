#!/usr/bin/env bash
set -u
docker build -q -t m04l02-taskapi:1.0.0 .
docker run -d --name m04l02-registry -p 18402:5000 registry:3
docker tag m04l02-taskapi:1.0.0 localhost:18402/taskapi:1.0.0
docker push localhost:18402/taskapi:1.0.0
curl -s localhost:18402/v2/_catalog
curl -s localhost:18402/v2/taskapi/tags/list
