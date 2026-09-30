# m03l03-08 · Cache mounts, and forcing a clean rebuild

**Lesson:** [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) (lesson 3.3, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

In the lesson: Two advanced tools finish the picture. When a dependency list does change, the install step runs again and downloads everything from scratch. A cache mount fixes that: the run step mounts a directory that BuildKit keeps between builds, so the package manager finds its earlier downloads. The mount's contents are not saved in the image and do not affect whether the step is reused, and the builder may clear them to free space, so the build must still work when it is empty. When you want a truly fresh build, for example to pick up security fixes, the no cache flag ignores every cached step. And chaining related commands in one step keeps them in one layer.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/cache-mounts-and-forcing-a-clean-rebuild.txt`](starter/cache-mounts-and-forcing-a-clean-rebuild.txt): the listing from the lesson
- [`starter/forms.Dockerfile`](starter/forms.Dockerfile)
- [`starter/pipe.Dockerfile`](starter/pipe.Dockerfile)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/cache-mounts-and-forcing-a-clean-rebuild.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m03l03-08` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
