#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

REF=localhost:18402/taskapi
docker rmi $REF:1.0.0 m04l02-taskapi:1.0.0
#   Untagged: localhost:18402/taskapi:1.0.0
#   Untagged: m04l02-taskapi:1.0.0
#   Deleted: sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
docker pull $REF:1.0.0
#   1.0.0: Pulling from taskapi
#   Digest: sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
#   Status: Downloaded newer image for localhost:18402/taskapi:1.0.0
#   localhost:18402/taskapi:1.0.0
D=$(docker inspect -f '{{index .RepoDigests 0}}' $REF:1.0.0)
echo $D
#   localhost:18402/taskapi@sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
docker rmi $REF:1.0.0
#   Untagged: localhost:18402/taskapi:1.0.0
#   Deleted: sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
docker pull $D
#   localhost:18402/taskapi@sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598: Pulling from taskapi
#   ...
#   localhost:18402/taskapi@sha256:b8900f09e507356ed2f0eab4c52cb990ef4761fb51c3da1be8bfc60f3dd08598
docker tag $D $REF:1.0.0
docker run --rm $REF:1.0.0 printenv APP_VERSION
#   1.0.0
