# m04l02-03 · Pull it back by tag and by digest

**Lesson:** [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) (lesson 4.2, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

In the lesson: Now prove the registry really holds the image. Keep the repository name in a shell variable, then delete both local tags, so the only copy left is in the registry. Now pull by tag: Docker asks the registry what the tag points to, receives the digest, and downloads the content. Store the digest it came with in another variable and print it. Remove the tag again, and this time pull by digest. The registry cannot answer a digest request with anything else, so this is the pull a production server should make. Put the tag back so later steps can use the friendly name, and run the version check to show the service is intact. The dots in the digest pull mean a long status line was cut from the screen.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   REF=localhost:18402/taskapi
   docker rmi $REF:1.0.0 m04l02-taskapi:1.0.0
   docker pull $REF:1.0.0
   D=$(docker inspect -f '{{index .RepoDigests 0}}' $REF:1.0.0)
   echo $D
   docker rmi $REF:1.0.0
   docker pull $D
   docker tag $D $REF:1.0.0
   docker run --rm $REF:1.0.0 printenv APP_VERSION
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l02-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
