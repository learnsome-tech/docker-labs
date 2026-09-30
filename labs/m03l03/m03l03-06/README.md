# m03l03-06 · Watch the cache: touch, edit, rebuild

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: Time to watch the cache work. Switch to plain progress, and define a tiny function that builds the service, so the commands stay short. Count the cached steps: all four after the base are reused. Now touch the source file, which changes its modification time and nothing else, and count again: still four, because timestamps are not part of the checksum. Next append a comment with the current time, so the content really changes, and ask which steps actually ran. The copy ran, and so did the data directory step after it, even though that command did not change: it sits on top of a new layer. Build once more and everything is cached again.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/forms.Dockerfile`](starter/forms.Dockerfile)
- [`starter/pipe.Dockerfile`](starter/pipe.Dockerfile)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   export BUILDKIT_PROGRESS=plain
   b() { docker build -t m03l03-api . 2>&1; }
   b | grep -c CACHED
   touch app.py && b | grep -c CACHED
   echo "# $(date)" >> app.py
   b | grep -B1 DONE | grep -o '\[./5].*'
   b | grep -c CACHED
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m03l03-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
