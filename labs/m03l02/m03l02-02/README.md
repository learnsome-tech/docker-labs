# m03l02-02 · Where each file lands: WORKDIR and COPY paths

**Lesson:** [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) (lesson 3.2, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

In the lesson: This experiment starts from the same base and asks one question: where does each file land? The first workdir instruction creates slash opt. The second gives a relative path, so it resolves against the one before, and every later instruction works in slash opt slash tasks. Copy with a dot as the destination, and the dot means that working directory. Copy to a name with no trailing slash, and the result is a file called backup. Copy to a name with a trailing slash, and Docker creates a directory and puts the file inside it. The last copy also sets an owner and mode while it copies. Build it, then list everything under slash opt, and every path matches those rules.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/Dockerfile` alongside the lesson.
2. Follow it the way the lesson builds it:
   - Lines 1: the same base
   - Lines 2–3: a relative path
   - Lines 4: the dot means
   - Lines 5–6: trailing slash
   - Lines 7–8: owner and mode
3. Notes from the lesson:
   - Line 5: no trailing slash: backup becomes a file
4. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker build -q -t m03l02-api:1 . && docker run --rm m03l02-api:1 find /opt | sort
   ```

## How to check

**Read along.** The listing does not run cleanly in the lab sandbox (it relies on something the sandbox cannot provide), so the site shows it read-only.

There is nothing to check: `./check m03l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
