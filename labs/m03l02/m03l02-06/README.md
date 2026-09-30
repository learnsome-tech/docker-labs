# m03l02-06 · ONBUILD: an instruction that waits for a child image

**Lesson:** [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) (lesson 3.2, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

In the lesson: One more instruction belongs with from, because it only fires through from. Write a base image with an on build trigger that copies the service into slash app. Build the base, and nothing is copied: the trigger is stored as metadata, which inspect shows you. Now write a one line child that does nothing but name the base in its from instruction. When you build the child, the trigger runs as if it were written right after that from line, in the child's own context, and the file is there. Triggers do not pass to grandchildren. They suit shared build images inside a team, but they hide steps from whoever reads the child, so most teams avoid them.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/add.Dockerfile`](starter/add.Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/sitecfg.tar.gz`](starter/sitecfg.tar.gz)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   echo 'FROM python:3.12-alpine' > base.Dockerfile
   echo 'ONBUILD COPY app.py /app/' >> base.Dockerfile
   docker build -q -f base.Dockerfile -t m03l02-base .
   docker image inspect -f '{{.Config.OnBuild}}' m03l02-base
   echo 'FROM m03l02-base' > child.Dockerfile
   docker build -q -f child.Dockerfile -t m03l02-child .
   docker run --rm m03l02-child ls /app
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l02-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
