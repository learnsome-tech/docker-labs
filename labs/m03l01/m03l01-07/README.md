# m03l01-07 · The file flag and the context are separate choices

**Lesson:** [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) (lesson 3.1, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

In the lesson: Watch what happens when the context is wrong. Name the temporary folder as the context, and the build fails before any instruction runs, because Docker looks for the Dockerfile inside the context by default and there is none there. Add the file flag, which picks the Dockerfile by a path relative to where you are standing, and the build gets further, then fails on the copy line: the program is not in that folder, and the error points straight at the instruction. Put the dot back and it builds. Two separate choices, then: the file flag says which instructions, and the last argument says which files. Mixing them up is the most common first build error there is.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/ctx.Dockerfile`](starter/ctx.Dockerfile)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker build -q -t m03l01-api:0.1 tmp
   docker build -q -f Dockerfile -t m03l01-api:0.1 tmp
   docker build -q -f Dockerfile -t m03l01-api:0.1 .
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l01-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
