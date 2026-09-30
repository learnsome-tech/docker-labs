#!/usr/bin/env bash
# Shell session from the video, as a file you can run.
# Each command below was typed at the prompt; the commented lines are what
# Docker printed back.
set -u

docker run -d --name m04l04-registry -p 18404:5000 registry:3
#   724f624ebc0c4be22496158b7150f1005b4bfbd4d457c2ac3a707eb7965947c8
I=localhost:18404/taskapi:1
docker buildx build -q --sbom=true -t $I --push .
#   sha256:29a1f3cf78ac0eeaf079fa0ba80bb451d97e69ac828ff9d50bde694492546423
docker buildx imagetools inspect $I
#   Name:      localhost:18404/taskapi:1
#   MediaType: application/vnd.oci.image.index.v1+json
#   Digest:    sha256:29a1f3cf78ac0eeaf079fa0ba80bb451d97e69ac828ff9d50bde694492546423
#   Manifests:
#     Name:        localhost:18404/taskapi:1@sha256:e26bba229529029916ff65bd7f6cc24d836f3d90059aee7ce54687b3a1697d3b
#     MediaType:   application/vnd.oci.image.manifest.v1+json
#     Platform:    linux/arm64
#     Name:        localhost:18404/taskapi:1@sha256:7bdb7817e3d8582c8d96893a9d9d29626de925f5f61f26323681bcf059d3b8a8
#     MediaType:   application/vnd.oci.image.manifest.v1+json
#     Platform:    unknown/unknown
#     Annotations:
#       vnd.docker.reference.digest: sha256:e26bba229529029916ff65bd7f6cc24d836f3d90059aee7ce54687b3a1697d3b
#       vnd.docker.reference.type:   attestation-manifest
