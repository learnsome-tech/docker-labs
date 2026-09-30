# m04l01-03 · A tag is a pointer, and pointers move

**Lesson:** [Tags, Digests And Reproducible Image References](https://learnsome.tech/learn/docker-course/m04l01) (lesson 4.1, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can read every part of an image reference, give one build several meaningful tags, and pin an image by digest so that every machine runs exactly the same bytes.

In the lesson: Now watch a tag move. Point a tag called stable at the alpine three point twenty two image and ask the container which release it holds. Then move the same tag to the older three point twenty image, and run exactly the same command again. Same name, same command, different software. A registry behaves the same way: whoever can push to a repository can replace what a tag points to at any moment. The publishers of alpine do it on purpose, moving each version tag to every new patch release, and latest is no exception. It is just the default tag name, not a promise of the newest build. Removing the tag deletes only the label. Nothing else is deleted, because the older alpine tag still points at that image.

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
   docker tag alpine:3.22 m04l01-base:stable
   docker run --rm m04l01-base:stable cat /etc/alpine-release
   docker tag alpine:3.20 m04l01-base:stable
   docker run --rm m04l01-base:stable cat /etc/alpine-release
   docker rmi m04l01-base:stable
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l01-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
