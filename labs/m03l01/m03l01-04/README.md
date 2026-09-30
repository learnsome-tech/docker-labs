# m03l01-04 · Copy everything, and you get everything

**Lesson:** [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) (lesson 3.1, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

In the lesson: Now the opposite extreme, and the one you will meet in real projects. This second Dockerfile, chosen with the file flag so it does not replace the real one, starts from the tiny busy box image and copies the whole context, dot, into one directory. Build it, run it, and list what arrived. Everything is there: the secret in the dot env file, the virtual environment, the thirty megabytes of scratch data, and both Dockerfiles. A copy of dot asks for every file, so every file travels, and every file lands in a layer that anyone who pulls the image can read. Swap this probe for your real service and the secret is now shipped.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/ctx.Dockerfile`](starter/ctx.Dockerfile): the listing from the lesson
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l01/m03l01-04/starter`
2. Read `ctx.Dockerfile` the way the lesson builds it:
   - Lines 1: tiny busy box image
   - Lines 2: copies the whole context
3. Edit `ctx.Dockerfile` and check it: `hadolint ctx.Dockerfile`.
4. Check it from the repository root: `./check m03l01-04`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l01-04 --command=<id>`:
   - `lint` (Lint): `hadolint ctx.Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info ctx.Dockerfile`

## How to check

`./check m03l01-04` copies `starter/` into a scratch directory and runs `hadolint ctx.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
