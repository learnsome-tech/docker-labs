# m02l02-02 · Create, start and observe

**Lesson:** [Run, Stop, Restart And Remove A Container](https://learnsome.tech/learn/docker-course/m02l02) (lesson 2.2, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can start a named container, observe its state, stop it cleanly, restart it, and remove the container without confusing it with its image.

In the lesson: Create a named container whose process sleeps, then start it and list the running state. Create prints an identifier and does not run the command yet. Start prints the name because the process is now attached to a live container. The running list shows the image, a shortened command, an age and a status beginning with the word up. The name is the handle we chose, and it is much safer to use that handle in a lesson than to copy an identifier by eye. Notice what is not in this command: there is no new image build. A container is a disposable runtime view over an image, not a second image.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker create --name lifecycle-demo alpine:3.20 sleep 30
   docker start lifecycle-demo
   docker ps --filter name=lifecycle-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l02-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
