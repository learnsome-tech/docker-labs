# m04l03-07 · Prove who the process is

**Lesson:** [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) (lesson 4.3, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

In the lesson: Build the service from its canonical Dockerfile. The python base on its own runs as root. Our image runs as the app user created in module three, with user and group ten thousand and one. That user cannot write into the application directory, because the code belongs to root, but it can write to the data directory it was given, which is exactly the split you want. Now the uncomfortable part: the user flag at run time overrides the image, and the same container comes up as root. The user instruction is a default, not a guarantee, so production platforms enforce non root in policy as well. The distroless worker runs fine and reports the nonroot user. Finally, clean up every image this lesson built.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/fat.Dockerfile`](starter/fat.Dockerfile)
- [`starter/go.Dockerfile`](starter/go.Dockerfile)
- [`starter/lean.Dockerfile`](starter/lean.Dockerfile)
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
   docker build -q -t m04l03-taskapi .
   docker run --rm python:3.12-alpine id -un
   docker run --rm m04l03-taskapi id
   docker run --rm m04l03-taskapi touch /app/x
   docker run --rm m04l03-taskapi touch /data/x
   docker run --rm --user 0 m04l03-taskapi id -u
   docker run --rm m04l03-worker
   docker image inspect -f '{{.Config.User}}' m04l03-worker
   docker rmi m04l03-taskapi m04l03-worker m04l03-fat m04l03-lean
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l03-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
