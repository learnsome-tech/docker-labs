#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker rm -f m04l02-registry
#   m04l02-registry
cat registry.env
#   REGISTRY_AUTH=htpasswd
#   REGISTRY_AUTH_HTPASSWD_REALM=m04l02 registry
#   REGISTRY_AUTH_HTPASSWD_PATH=/auth/htpasswd
R="-p 18402:5000 --env-file registry.env -v ./auth:/auth"
docker run -d --name m04l02-registry $R registry:3
#   3ea987d13dcd77c94104d6df63c80b98e0968997ca5106aa75195d21338d2ab4
curl -s -o /dev/null -w '%{http_code}\n' localhost:18402/v2/
#   401
docker push -q localhost:18402/taskapi:1.0.0 2>&1 | fold -sw80
#   push access denied, repository does not exist or may require authorization:
#   authorization failed: no basic auth credentials
