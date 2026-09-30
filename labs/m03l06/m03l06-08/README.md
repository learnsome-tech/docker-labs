# m03l06-08 · The task API's finished Dockerfile

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: Here is the task API's reference file, which the rest of the course builds on. It opens with the same five lines you wrote in the early lessons: base image, a fixed user, a working directory, the program, and a data directory that user owns. Then the runtime defaults: environment variables, the switch to the non root user, and the documented port. One line is new, a health check that asks the service's own health endpoint every few seconds; module six explains it properly. The last line is the exec form command. The reference keeps literal values rather than build arguments, and it has one stage, because a Python program has nothing to compile. Build it and print its environment: our three variables, and a home directory that belongs to the app user.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/leak/Dockerfile`](starter/leak/Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/safe/Dockerfile`](starter/safe/Dockerfile)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l06/m03l06-08/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–5: the same five lines
   - Lines 6–8: runtime defaults
   - Lines 9–10: a health check
   - Lines 11: the exec form command
3. Notes from the lesson:
   - Line 9: explained in module six: how Docker decides the app is healthy
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l06-08`.

## How to check

`./check m03l06-08` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
