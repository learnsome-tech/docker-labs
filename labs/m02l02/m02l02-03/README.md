# m02l02-03 · Stop and inspect the exit

**Lesson:** [Run, Stop, Restart And Remove A Container](https://learnsome.tech/learn/docker-course/m02l02) (lesson 2.2, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can start a named container, observe its state, stop it cleanly, restart it, and remove the container without confusing it with its image.

In the lesson: Stop the sleeping process, list all containers rather than only running ones, and then start it attached to your terminal. Stop sends the process a termination signal and waits. Because the shell exits normally, the status records exit code zero. The all flag matters: without it, a stopped container disappears from the ordinary running list. Start with attach waits for the process and forwards its output, which is useful for a short command and awkward for a long service. The important point is that stopping preserves the container and its writable state. Starting it again reuses that state; it does not create a new writable layer.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker stop lifecycle-demo
   docker ps -a --filter name=lifecycle-demo
   docker start -a lifecycle-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l02-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
