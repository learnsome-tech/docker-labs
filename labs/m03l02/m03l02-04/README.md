# m03l02-04 · Ownership and permissions are set at copy time

**Lesson:** [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) (lesson 3.2, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

In the lesson: Ask a container for the owner and mode of each copy. The plain copy is owned by root, with the mode it had on your disk. The flagged copy belongs to user and group ten thousand and one, readable and writable only by that user. A numeric user does not even need to exist in the image, while a name must be listed in the image's password file. Why not copy first and change the owner in a later step? Because that step rewrites every file into a new layer, so the image carries both copies. The last command shows that the working directory is also where a container starts, which is why the task API never needs to change directory.

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
   docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' app.py
   docker run --rm m03l02-api:1 stat -c '%u:%g %a %n' private.py
   docker run --rm m03l02-api:1 pwd
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l02-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
