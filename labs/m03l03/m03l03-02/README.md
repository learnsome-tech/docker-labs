# m03l03-02 · Two RUN steps give the service a user and a data directory

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: The service Dockerfile grows by two run steps. The first creates a user called app, with no password and the fixed user ID ten thousand and one, so file ownership means the same thing on every machine. The working directory and the copy are the same as before. The second run step makes the data directory where the service keeps its tasks and gives it to that user, which the service will need once it stops running as root. The default command closes the file. Build it and read the history of each layer. Both run steps were stored as slash bin slash s h, dash c, and then your command, exactly as the shell form promised.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l03/m03l03-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–2: creates a user
   - Lines 3–4: same as before
   - Lines 5: makes the data directory
   - Lines 6: default command
3. Notes from the lesson:
   - Line 2: no password, fixed user ID 10001
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l03-02`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m03l03-02 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m03l03-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
