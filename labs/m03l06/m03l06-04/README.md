# m03l06-04 · The wrong way to hand a build a token

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: Builds often need a credential, such as a token for a private package index, and the tempting way is a build argument. This small file, in its own directory, declares an API token as a build argument and has a run step that checks that it arrived. Build it with a made up token and the full progress output, and read what comes back. The builder's own checks flag the problem before anything runs, with a warning named secrets used in arg or env. Then look at the run step as it is printed: the variable has already been replaced by the token itself, in plain text, in the build log. On a pipeline those logs are kept and shared. And as you saw two lessons ago, the value is also written into the image history for everyone who pulls it.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/leak/Dockerfile`](starter/leak/Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l06/m03l06-04/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–2: a build argument
   - Lines 3: checks that it arrived
3. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
4. Check it from the repository root: `./check m03l06-04`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l06-04 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m03l06-04` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
