# m03l02-01 · FROM chooses the filesystem you start with

**Lesson:** [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) (lesson 3.2, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Read along

## Goal

You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

In the lesson: Every Dockerfile begins with the from instruction, and only a build argument may appear above it. It names the base image: every file in that image becomes the bottom of your stack, so choosing it is choosing a Linux distribution, a C library, a language runtime and every vulnerability they carry. Leave the tag off and Docker assumes latest, which is only a label that the publisher moves whenever they like. So pin a tag that says what you mean, like Python three point twelve on Alpine. When a build must repeat exactly, add the digest as well, which names the content itself; module four does that properly. At the other extreme, from scratch means an empty filesystem, for programs that carry everything they need.

## Files

- [`starter/from-chooses-the-filesystem-you-start-with.txt`](starter/from-chooses-the-filesystem-you-start-with.txt): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/from-chooses-the-filesystem-you-start-with.txt` alongside the lesson.

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m03l02-01` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
