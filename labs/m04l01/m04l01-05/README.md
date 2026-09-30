# m04l01-05 · Run by digest, and see the tag ignored

**Lesson:** [Tags, Digests And Reproducible Image References](https://learnsome.tech/learn/docker-course/m04l01) (lesson 4.1, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can read every part of an image reference, give one build several meaningful tags, and pin an image by digest so that every machine runs exactly the same bytes.

In the lesson: The tree view shows the index and its platform entries. On this machine only the sixty four bit arm entry has content; the others are listed but were never downloaded. Next, capture the digest of the alpine three point twenty two image in a shell variable and print it: the repository name, an at sign, and the hash. Run by that digest and you get three point twenty two, today and in five years, on any machine. The last line pairs the wrong tag, three point twenty, with the right digest, using a shell expansion that keeps only the part after the at sign. The container still reports three point twenty two. When a reference carries both, the tag is decoration and the digest decides, which is useful for a reader and misleading if the two drift apart.

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
   docker image ls --tree alpine:3.22
   D=$(docker inspect -f '{{index .RepoDigests 0}}' alpine:3.22)
   echo $D
   docker run --rm $D cat /etc/alpine-release
   docker run --rm alpine:3.20@${D#*@} cat /etc/alpine-release
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l01-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
