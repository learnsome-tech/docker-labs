#!/usr/bin/env bash
# What earlier panels of this lesson ran, so this one has something to work with.
set -u
docker build -q -t m04l02-taskapi:1.0.0 .
docker run -d --name m04l02-registry -p 18402:5000 registry:3
docker tag m04l02-taskapi:1.0.0 localhost:18402/taskapi:1.0.0
docker push localhost:18402/taskapi:1.0.0
curl -s localhost:18402/v2/_catalog
curl -s localhost:18402/v2/taskapi/tags/list
REF=localhost:18402/taskapi
docker rmi $REF:1.0.0 m04l02-taskapi:1.0.0
docker pull $REF:1.0.0
D=$(docker inspect -f '{{index .RepoDigests 0}}' $REF:1.0.0)
echo $D
docker rmi $REF:1.0.0
docker pull $D
docker tag $D $REF:1.0.0
docker run --rm $REF:1.0.0 printenv APP_VERSION
docker rm -f m04l02-registry
cat registry.env
R="-p 18402:5000 --env-file registry.env -v ./auth:/auth"
docker run -d --name m04l02-registry $R registry:3
curl -s -o /dev/null -w '%{http_code}\n' localhost:18402/v2/
docker push -q localhost:18402/taskapi:1.0.0 2>&1 | fold -sw80
export DOCKER_CONFIG=/tmp/m04l02-client
docker login localhost:18402 -u ci-bot --password-stdin <token
jq . $DOCKER_CONFIG/config.json
docker push -q localhost:18402/taskapi:1.0.0
docker logout localhost:18402
docker rm -f m04l02-registry
docker rmi localhost:18402/taskapi:1.0.0
rm -rf $DOCKER_CONFIG
