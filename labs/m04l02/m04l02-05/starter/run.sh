#!/usr/bin/env bash
set -u
bash setup.sh >/dev/null 2>&1
docker rm -f m04l02-registry
cat registry.env
R="-p 18402:5000 --env-file registry.env -v ./auth:/auth"
docker run -d --name m04l02-registry $R registry:3
curl -s -o /dev/null -w '%{http_code}\n' localhost:18402/v2/
docker push -q localhost:18402/taskapi:1.0.0 2>&1 | fold -sw80
