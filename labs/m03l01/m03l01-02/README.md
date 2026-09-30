# m03l01-02 · Four lines that turn the service into an image

**Lesson:** [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) (lesson 3.1, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

In the lesson: This is the four line Dockerfile behind the image you ran at the end of module two, and this module takes it apart one instruction at a time. The first line starts from an official image that already holds Python on Alpine Linux. The second sets the working directory, creating it if it is missing. The third copies one file from the build context into that directory; the dot on the right means here, wherever the working directory is. The fourth records the default command a container runs when it starts. Build it with the quiet flag, and Docker prints only the new image identifier. Then a throwaway container prints where it starts and what it finds there: the app directory, holding exactly one file.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l01/m03l01-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1: starts from an official image
   - Lines 2: sets the working directory
   - Lines 3: copies one file
   - Lines 4: records the default command
3. Notes from the lesson:
   - Line 3: source is relative to the context, the dot is the working directory
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l01-02`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l01-02 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m03l01-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
