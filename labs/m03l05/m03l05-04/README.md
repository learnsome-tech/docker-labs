# m03l05-04 · ENTRYPOINT fixes the program, CMD supplies defaults

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: Cmd and entrypoint are easy to confuse, so here is a tiny image that separates them. An entrypoint is the fixed part: the program the container always runs. Here it is the echo command with the word task as its first argument, standing in for a real command line tool. The cmd line holds the default arguments, which Docker appends to the entrypoint. So with no arguments this container runs echo task list. Anything you type after the image name on docker run is not added to the default arguments; it is replaced by anything you type, while the entrypoint stays. When an image has only a cmd, as our task API does, the whole command is the default, and any argument replaces all of it.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/Dockerfile.tool`](starter/Dockerfile.tool): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l05/m03l05-04/starter`
2. Read `Dockerfile.tool` the way the lesson builds it:
   - Lines 1: a tiny image
   - Lines 2: the fixed part
   - Lines 3: the default arguments
3. Notes from the lesson:
   - Line 3: appended to ENTRYPOINT; replaced by arguments to docker run
4. Edit `Dockerfile.tool` and check it: `hadolint Dockerfile.tool`.
5. Check it from the repository root: `./check m03l05-04`.

## How to check

`./check m03l05-04` copies `starter/` into a scratch directory and runs `hadolint Dockerfile.tool` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
