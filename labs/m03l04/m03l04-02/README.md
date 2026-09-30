# m03l04-02 · Build arguments, labels and runtime defaults

**Lesson:** [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) (lesson 3.4, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

In the lesson: Here is the task API file, with four new kinds of line. The first line is an arg before the from line: a build argument choosing the Python tag. An argument declared up there is only visible to from lines, so it lets you swap the base image without editing the file. The middle is the same as last lesson. Then comes a second arg, the application version, with a default of one point zero point zero. The label under it records a title and that version, using keys from the open container initiative. Next, the env line sets the port, the data directory and the version, copying the argument into a variable that will still exist when the container runs. Finally, expose records port eight thousand. Build it with the build arg flag set to one point one point zero, then print the environment of a fresh container: our three variables, and everything the Python image set before us.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l04/m03l04-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–2: before the from line
   - Lines 3–6: the same as last lesson
   - Lines 7–9: a second arg
   - Lines 10: the env line
   - Lines 11–12: expose records
3. Notes from the lesson:
   - Line 1: declared before FROM: usable only in FROM lines
   - Line 10: copies a build-time value into the runtime environment
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l04-02`.

## How to check

`./check m03l04-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
