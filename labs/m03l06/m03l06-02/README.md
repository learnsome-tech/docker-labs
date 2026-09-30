# m03l06-02 · Build in one stage, ship from another

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: The course ships a tiny Go task worker that prints which queue it serves. Read the file as three stages. The first stage, named build, starts from the Go image, copies the source in and compiles it, with the setting that turns off calls into C, so the result is statically linked and needs no system libraries. The second stage, named test, starts from the build stage and runs Go's own checker over the code. The last stage, named release, starts from a distroless image: no shell, no package manager, just the files a static program needs and a user called nonroot. It copies one file from the build stage, switches to that user and sets the entrypoint. Build it, then run it with a queue name, and the worker answers from an image that has never contained a compiler.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l06/m03l06-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–4: the first stage
   - Lines 5–7: the second stage
   - Lines 8–12: the last stage
3. Notes from the lesson:
   - Line 4: no C library needed: one static file
   - Line 10: only this file crosses from the build stage
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l06-02`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l06-02 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m03l06-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
