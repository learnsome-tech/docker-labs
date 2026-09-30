# m03l04-06 · VOLUME: a mount point that creates volumes

**Lesson:** [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) (lesson 3.4, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

In the lesson: Volume is the one metadata instruction with a real side effect. It marks a directory as a mount point, and whenever a container starts without something mounted there, Docker creates a fresh anonymous volume, a storage area with a random name that lives outside the container's writable layer. The official postgres image declares its data directory this way. Create a container from it without starting it, save a format string in a shell variable to keep the line short, and list its mounts: there is already a volume at the data directory, although you never asked for one. Remove the container with the v flag, which deletes anonymous volumes along with it. Without that flag, or the remove flag on docker run, the volume stays behind with no name to find it by. Our task API deliberately has no volume line: module five mounts its storage explicitly.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker inspect -f '{{.Config.Volumes}}' postgres:16-alpine
   docker create --name m03l04-pg postgres:16-alpine
   f='{{range .Mounts}}{{.Type}} {{.Destination}}{{end}}'
   docker inspect -f "$f" m03l04-pg
   docker rm -v m03l04-pg
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l04-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
