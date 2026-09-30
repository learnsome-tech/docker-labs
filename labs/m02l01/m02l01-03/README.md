# m02l01-03 · Inspect metadata, not guesses

**Lesson:** [Pull And Inspect A Third Party Image](https://learnsome.tech/learn/docker-course/m02l01) (lesson 2.1, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can pull a trusted image, read its metadata, and explain which parts of an image are content and which parts are a mutable runtime choice.

In the lesson: Inspection answers questions that a tag cannot. Ask for the operating system and architecture, and Docker reads the image configuration rather than guessing from your laptop. Ask for the default command, and you learn what starts when you run the image without adding a command of your own. Finally, history shows the stack of filesystem layers and the instructions that created them. History is useful for orientation, but it is not a security audit and it is not a complete source listing. An image can contain a package that a later layer deletes, and the bytes remain in the lower layer. That is why image construction and scanning deserve their own lessons.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker image inspect alpine:3.20 --format '{{.Os}}'
   docker image inspect alpine:3.20 --format '{{.Config.Cmd}}'
   docker image history alpine:3.20
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l01-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l01) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
