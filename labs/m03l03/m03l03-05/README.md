# m03l03-05 · How the build cache decides what to reuse

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: Before running a step, BuildKit looks for a previous result with the same parent layer and the same instruction. For copy and add it also compares a checksum of the files involved, built from their contents and metadata but not their modification times. For a run step it compares only the command text; it never checks whether the internet has newer packages. The moment one step misses, that step and every step after it are rebuilt. That single rule decides the shape of a good Dockerfile: things that rarely change go first, things that change on every commit go last. The pattern on screen is the classic example: copy the dependency list alone, install, and only then copy the source.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/forms.Dockerfile`](starter/forms.Dockerfile)
- [`starter/how-the-build-cache-decides-what-to-reuse.txt`](starter/how-the-build-cache-decides-what-to-reuse.txt): the listing from the lesson
- [`starter/pipe.Dockerfile`](starter/pipe.Dockerfile)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/how-the-build-cache-decides-what-to-reuse.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m03l03-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
