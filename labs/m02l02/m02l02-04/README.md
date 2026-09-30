# m02l02-04 · Remove the runtime object

**Lesson:** [Run, Stop, Restart And Remove A Container](https://learnsome.tech/learn/docker-course/m02l02) (lesson 2.2, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can start a named container, observe its state, stop it cleanly, restart it, and remove the container without confusing it with its image.

In the lesson: Now remove the stopped container and list the image again. Remove deletes the name, metadata and writable layer that belonged to this runtime object. It does not delete the alpine image, because the image is a separate object and other containers may depend on it. This distinction is the foundation of cleanup. Remove old containers freely when their state is disposable. Remove images only after checking that no useful container or build depends on them. If a running container must go, the force flag combines a kill with removal, but use it as an emergency shortcut rather than your normal shutdown path.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker rm lifecycle-demo
   docker image ls alpine:3.20
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l02-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
