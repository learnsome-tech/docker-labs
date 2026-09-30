# m02l01-02 · Pull a small image

**Lesson:** [Pull And Inspect A Third Party Image](https://learnsome.tech/learn/docker-course/m02l01) (lesson 2.1, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can pull a trusted image, read its metadata, and explain which parts of an image are content and which parts are a mutable runtime choice.

In the lesson: Pull a small image and then list the local copy. The first command resolves the short name through Docker Hub, downloads each missing layer, and records the tag. The dots stand for progress lines that change order and are not useful to teach. The second command asks the local image store for that one repository and tag. The image identifier is shortened on screen because it changes when the publisher rebuilds the same tag, and the size is also allowed to vary between architectures. What should not vary is the repository name and the tag you requested. This is the first rule of reading Docker output: stable labels are facts, while identifiers and measurements are clues.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker pull alpine:3.20
   docker image ls alpine:3.20
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l01-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
