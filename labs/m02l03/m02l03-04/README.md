# m02l03-04 · Exit codes tell the ending

**Lesson:** [Commands, Logs, Exec And Exit Codes](https://learnsome.tech/learn/docker-course/m02l03) (lesson 2.3, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Read along

## Goal

You can inspect a running container without rebuilding it, read its logs, execute a diagnostic command, and use exit codes to find the real failure.

In the lesson: Run a short command that exits with seven, then print the shell's own status. Docker returns control to the shell, and the dollar question mark holds the exit code from the docker run command. Inspect confirms the same number in the container state, along with the word exited. This is the difference between a Docker command failing to contact the daemon and the program inside a container choosing a nonzero result. Both deserve attention, but they lead to different fixes. Always capture the exit code before a cleanup command replaces it.

## Files

- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker run --name exit-demo alpine:3.20 false; echo code:0$?
   docker inspect exit-demo --format '{{.State.ExitCode}}'
   docker rm exit-demo
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m02l03-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
