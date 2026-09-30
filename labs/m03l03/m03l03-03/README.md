# m03l03-03 · Shell form and exec form, side by side

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: To see the difference between the two forms, make each one create a file whose name asks who is running. Start with an empty working directory. The shell form hands the whole line to the shell, which runs the who am I command first and puts its answer into the name. The exec form runs touch directly. No shell sees the line, so nothing is substituted, and the dollar sign and brackets become part of the file name. Build it and list the directory: one file says root, because build steps run as root unless told otherwise, and the other still contains the question. Use the shell form for command lines; use the exec form when you need no shell in between.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/forms.Dockerfile`](starter/forms.Dockerfile): the listing from the lesson
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l03/m03l03-03/starter`
2. Read `forms.Dockerfile` the way the lesson builds it:
   - Lines 1–2: empty working directory
   - Lines 3: shell form
   - Lines 4: exec form
3. Edit `forms.Dockerfile` and check it: `hadolint forms.Dockerfile`.
4. Check it from the repository root: `./check m03l03-03`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l03-03 --command=<id>`:
   - `lint` (Lint): `hadolint forms.Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info forms.Dockerfile`

## How to check

`./check m03l03-03` copies `starter/` into a scratch directory and runs `hadolint forms.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
