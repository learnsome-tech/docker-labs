# m03l06-05 · The right way: a secret mount for one step

**Lesson:** [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) (lesson 3.6, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

In the lesson: The fix is a secret mount. The run instruction takes a mount option of type secret with an identifier, and the builder places the secret as a file under slash run slash secrets, named after that identifier, only for the duration of that one step. It is never written to a layer, never shown in the history and never printed in the log. The step reads the file instead of a variable. On the build command, the secret flag names the identifier. With no source given, the builder looks for an environment variable of the same name, so we set one just for this command. A source file works too. Nothing about the secret appears in the output, only the new image identifier.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/leak/Dockerfile`](starter/leak/Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/safe/Dockerfile`](starter/safe/Dockerfile)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l06/m03l06-05/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–2: a secret mount
   - Lines 3: slash run slash secrets
3. Notes from the lesson:
   - Line 2: mounted for this RUN only; never written to a layer
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l06-05`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l06-05 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m03l06-05` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l06) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
