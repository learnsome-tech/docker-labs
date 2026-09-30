# m03l05-02 · Stop running the service as root

**Lesson:** [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) (lesson 3.5, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

In the lesson: Without a user instruction, everything in a container runs as root, the all powerful user. The file already creates a user named app with a fixed user ID of ten thousand and one, high enough not to collide with accounts on the host, and it hands the data directory to that user. The rest is unchanged from last lesson, except for one new line: user app. From that point on, later build steps and the running container use that identity. The command stays in exec form, so Python itself will be the first process. Build it, then run it with an argument after the image name, which replaces the default command for that run. Ask the container who it is, and it answers ten thousand and one, not root.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l05/m03l05-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1–3: creates a user
   - Lines 4–6: hands the data directory
   - Lines 7–10: unchanged from last lesson
   - Lines 11: one new line
   - Lines 12–13: stays in exec form
3. Notes from the lesson:
   - Line 3: fixed user ID 10001, no password, no login shell needed
   - Line 11: every later RUN, and the container, run as app
4. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
5. Check it from the repository root: `./check m03l05-02`.

## How to check

`./check m03l05-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
