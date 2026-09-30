# m04l03-03 · A layer that deletes nothing

**Lesson:** [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) (lesson 4.3, module 4: Registries, Image Size And Security) · Pro  
**Check:** Checker

## Goal

You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

In the lesson: Here is the most common way images get fat. The second line writes forty megabytes of zeros, standing in for a downloaded toolchain or a package cache. The third line deletes it, and the image is no smaller. Each instruction that changes files becomes its own layer, and layers are only ever added. The delete is recorded in a new layer as a marker that hides the file, while the forty megabytes stay in the layer below, downloaded by every machine that pulls the image. The image history command shows each layer and its size, newest at the top, and it is the first tool to reach for when an image is bigger than you expected. Here the delete cost almost nothing and saved nothing.

## Files

- [`starter/fat.Dockerfile`](starter/fat.Dockerfile): the listing from the lesson
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m04l03/m04l03-03/starter`
2. Read `fat.Dockerfile` the way the lesson builds it:
   - Lines 1–2: forty megabytes
   - Lines 3–4: deletes it
3. Edit `fat.Dockerfile` and check it: `hadolint fat.Dockerfile`.
4. Check it from the repository root: `./check m04l03-03`.

## How to check

`./check m04l03-03` copies `starter/` into a scratch directory and runs `hadolint fat.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
