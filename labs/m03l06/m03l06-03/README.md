# m03l06-03 · What shipped, what stayed behind, and targets

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: Compare sizes. The Go image takes three hundred and sixty five megabytes on disk. Our worker takes under ten, and most of that is the distroless base. Now read its history: the top three entries are our release stage, and below them only the base image's layers. The build stage, with its compiler and source, is not in there at all. One more thing about that build: the test stage never ran, because nothing the release stage needs depends on it, and the builder skips stages it does not need. To build it on purpose, use the target flag, which stops the build at the named stage and tags that. Run the test image and the file proves the checker ran. The same flag builds development or debugging images from one file.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker image ls golang:1.23-alpine
   docker image ls m03l06-worker
   docker history m03l06-worker
   docker build -q --target test -t m03l06-test .
   docker run --rm m03l06-test cat /out/vet.txt
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l06-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
