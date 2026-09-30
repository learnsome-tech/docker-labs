# m03l04-04 · Labels worth setting, and one instruction to stop using

**Lesson:** [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) (lesson 3.4, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

In the lesson: A label is a key and a value, and you could invent any keys you like. Please do not. The open container initiative defines a set of annotation keys, all sharing the long prefix you can see on screen, and registries, scanners and deployment tools already know how to read them. The two that pay off first are source, the address of the repository, and revision, the commit the image was built from. Fill revision from a build argument in your pipeline and any running container can be traced to its exact code. Labels are inherited, so your image also carries whatever the base image declared, and a later label with the same key replaces the earlier one. Older files start with a maintainer line. That instruction is deprecated: put the same information in the authors label, which tools can actually query.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/labels-worth-setting-and-one-instruction-to-.txt`](starter/labels-worth-setting-and-one-instruction-to-.txt): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/labels-worth-setting-and-one-instruction-to-.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m03l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
