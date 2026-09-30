# m02l03-02 · A container that leaves evidence

**Lesson:** [Commands, Logs, Exec And Exit Codes](https://learnsome.tech/learn/docker-course/m02l03) (lesson 2.3, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can inspect a running container without rebuilding it, read its logs, execute a diagnostic command, and use exit codes to find the real failure.

In the lesson: Start a detached container that prints one line and then sleeps. Logs reads the line from the main process, without opening a shell or changing the image. Inspect asks Docker for the state and prints two fields: the status is running and the running flag is true. This is deliberately boring output, because boring output teaches a reliable sequence. First ask what the process said. Then ask Docker whether the process is alive. Only after those answers should you enter the container or change its configuration. A log line is application evidence; a state field is Docker evidence, and mixing them up leads to poor diagnoses.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker run -d --name command-demo alpine:3.20 sleep 20
   docker logs command-demo
   docker inspect command-demo --format '{{.State.Status}}'
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l03-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
