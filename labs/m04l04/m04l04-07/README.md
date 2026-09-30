# m04l04-07 · Patch by rebuilding on a supported base

**Lesson:** [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) (lesson 4.4, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

In the lesson: Patching a container is not logging in and upgrading packages; it is rebuilding the image on a fixed base and redeploying. This small Dockerfile takes the Alpine version as a build argument and prints the release and two security sensitive packages. The old build reports Alpine three point twenty. That branch reached its end of support in April twenty twenty six, so no rebuild of it will ever pick up another fix. Rebuild with the argument pointing at a supported branch and run the same check: newer OpenSSL, newer C library, one changed line. On a supported tag the same idea is a scheduled rebuild with the pull flag, which fetches the newest copy of the base, and no cache, which reruns your package installs.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/base/Dockerfile`](starter/base/Dockerfile)
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
   cat base/Dockerfile
   docker build -q -t m04l04-base:old base
   docker run --rm m04l04-base:old
   docker build -q -t m04l04-base:new --build-arg TAG=3.22 base
   docker run --rm m04l04-base:new
   docker rmi m04l04-base:old m04l04-base:new m04l04-taskapi:1
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l04-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
