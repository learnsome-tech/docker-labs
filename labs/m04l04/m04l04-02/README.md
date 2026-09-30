# m04l04-02 · List what is inside the service image

**Lesson:** [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) (lesson 4.4, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

In the lesson: Start with the inventory. Build the service, then ask which Alpine release its base carries: the python image we chose sits on Alpine three point twenty four. Now ask Docker Scout to list every package it can find in the image. Scout is Docker's own scanner, and this command runs entirely on your machine. The list is long, so the screen shows only a few rows. There is the OpenSSL library and its command line tool, the C library, the pip installer and Python itself, each with an exact version and a type saying which ecosystem it came from. The full list has over fifty entries for a service we wrote with no dependencies at all. Every one of them is something that may need patching.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker build -q -t m04l04-taskapi:1 .
   docker run --rm m04l04-taskapi:1 cat /etc/alpine-release
   docker scout sbom --format list m04l04-taskapi:1 2>/dev/null
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l04-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
