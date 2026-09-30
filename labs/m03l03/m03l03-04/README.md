# m03l03-04 · SHELL, and a pipe that hides a failure

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: A shell reports only the last command's result for a pipe, and that hides real failures, like a download that failed while a later command happily read nothing. The second line is a pipe whose first command fails, and the step passes. The shell instruction replaces the shell that every later shell form uses, and here it keeps the default shell but adds the pipe fail option. The same pipe again, and now the failure counts. Build it, and the build stops with the arrow on line four, while line two went through. The shell instruction must be written in exec form, and it also applies to shell form commands and entry points later in the file.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/forms.Dockerfile`](starter/forms.Dockerfile)
- [`starter/pipe.Dockerfile`](starter/pipe.Dockerfile): the listing from the lesson
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l03/m03l03-04/starter`
2. Read `pipe.Dockerfile` the way the lesson builds it:
   - Lines 1–2: a pipe whose first command fails
   - Lines 3: the shell instruction
   - Lines 4: same pipe again
3. Edit `pipe.Dockerfile` and check it: `hadolint pipe.Dockerfile`.
4. Check it from the repository root: `./check m03l03-04`.

## How to check

`./check m03l03-04` copies `starter/` into a scratch directory and runs `hadolint pipe.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
