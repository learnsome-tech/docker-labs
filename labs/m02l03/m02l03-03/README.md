# m02l03-03 · Exec a diagnostic process

**Lesson:** [Commands, Logs, Exec And Exit Codes](https://learnsome.tech/learn/docker-course/m02l03) (lesson 2.3, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can inspect a running container without rebuilding it, read its logs, execute a diagnostic command, and use exit codes to find the real failure.

In the lesson: Exec starts a new process in the running container, so ask for its process list and then print a short diagnostic word. The shell you start with exec is not the container's main process. It shares the same namespaces, filesystem and environment, but it has its own lifetime and exit code. Docker top gives you another view of the processes, collected by the daemon rather than printed by the container. This distinction matters when a shell command appears healthy while the service process is failing. You are looking at two processes in one runtime object, and each can tell a different part of the story.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker exec command-demo ps
   docker exec command-demo true
   docker top command-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l03-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
