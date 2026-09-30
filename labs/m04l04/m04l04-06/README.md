# m04l04-06 · Read the SBOM and the provenance

**Lesson:** [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) (lesson 4.4, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

In the lesson: Keep the inspect command in a variable, then save the bill of materials as a file and count its packages: forty seven, in an industry standard format that any scanner can read later without rebuilding. Next save the provenance and pull out what the build consumed. There are two inputs: the scanner BuildKit ran to produce the bill of materials, and the python base image. Then print their digests. Compare the second with the identifier of the python base on this machine: they are identical. Months from now, when an advisory lands for that exact base, this record tells you which of your images were built on it, without guessing from tags. Finally, clean up the registry and the pushed tag.

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
   T="docker buildx imagetools inspect localhost:18404/taskapi:1"
   $T --format '{{json .SBOM}}' >s.json
   jq '.SPDX.packages | length' s.json
   $T --format '{{json .Provenance}}' >p.json
   jq -r '..|.uri? // empty' p.json
   jq -r '..|.sha256? // empty' p.json
   docker image inspect -f '{{.Id}}' python:3.12-alpine
   docker rm -f m04l04-registry
   docker rmi localhost:18404/taskapi:1
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l04-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
