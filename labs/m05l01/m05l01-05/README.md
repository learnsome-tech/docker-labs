# m05l01-05 · Find, inspect and remove a volume

**Lesson:** [Ephemeral Filesystems And Named Volumes](https://learnsome.tech/learn/docker-course/m05l01) (lesson 5.1, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can show that a container's writable layer is deleted with the container, keep the task API's data in a named volume that survives removal, and find, inspect and safely remove volumes.

In the lesson: Volumes are objects you manage, just like images and containers. List them with a name filter to find ours, on the local driver, which means a plain directory on the Docker host. Inspect it, and the mount point shows where that directory lives. On Docker Desktop that path is inside Docker's Linux virtual machine, not on your laptop's disk, so you reach volume data through a container rather than a file browser. Now create a container that uses the volume but never runs, and ask which containers use it: the process status command can filter by volume, and it finds stopped containers too. Try to remove the volume and Docker refuses, because a container still references it. The cut on screen only trims a long container identifier off the message. Remove that container first, and now it goes.

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
   docker volume ls --filter name=m05l01
   docker volume inspect -f '{{.Mountpoint}}' m05l01-data
   docker create --name m05l01-hold -v m05l01-data:/v alpine:3.20
   docker ps -a --filter volume=m05l01-data --format '{{.Names}}'
   docker volume rm m05l01-data 2>&1 | cut -d'[' -f1
   docker rm m05l01-hold
   docker volume rm m05l01-data
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l01-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
