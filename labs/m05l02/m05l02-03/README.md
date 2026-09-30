# m05l02-03 · Read-only mounts, and a source that does not exist

**Lesson:** [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) (lesson 5.2, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

In the lesson: Two details matter in real use. Add the read only suffix after a second colon, and the container can read the directory but not change it: the touch fails with a read only file system error. Use it for configuration files and secret files, anything the service should never rewrite. Next, give the volume flag a path that does not exist, as if you had mistyped it. Docker does not complain. It creates an empty directory called typo on the host, mounts that, and your service starts against nothing. The mount flag refuses the same mistake: the bind source path does not exist, and the container is never created. That strictness is why scripts and production commands should prefer the mount flag. Remove the stray directory before moving on.

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
   docker run --rm -v ./data:/data:ro alpine:3.20 touch /data/x
   docker run --rm -v ./typo:/n alpine:3.20 true && ls
   docker run --mount type=bind,src=/typo,dst=/n alpine:3.20
   rmdir typo
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l02-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
