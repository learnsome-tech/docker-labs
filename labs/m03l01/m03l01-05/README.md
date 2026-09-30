# m03l01-05 · A .dockerignore file keeps them out

**Lesson:** [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) (lesson 3.1, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

In the lesson: The fix is a dockerignore file at the root of the context. It holds one pattern per line, and a line starting with the hash character is a comment. Leading and trailing slashes are ignored, a star matches within one directory level, and two stars match any depth. Exclude the virtual environment and the temporary folder, and above all the secret. Rebuild the probe with the same command, and the listing is back to what a build should see. The client strips matching files before the builder can ask for them, so no instruction can copy them by accident. A line starting with an exclamation mark makes an exception, and when several lines match a file, the last one wins.

## Files

- [`starter/.dockerignore`](starter/.dockerignore): the listing from the lesson
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/ctx.Dockerfile`](starter/ctx.Dockerfile)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/.dockerignore` alongside the lesson.
2. Follow it the way the lesson builds it:
   - Lines 1–3: one pattern per line
   - Lines 4–5: the secret
3. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker build -q -f ctx.Dockerfile -t m03l01-ctx . && docker run --rm m03l01-ctx find /ctx | sort
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l01-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
