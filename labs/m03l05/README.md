# m03l05 · CMD, ENTRYPOINT, USER And Process Signals

Module 3: Build Images Instruction By Instruction · lesson 3.5 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l05)

**Goal:** You can choose between exec and shell form, predict how CMD and ENTRYPOINT combine and get overridden, run a service as a non-root user that owns only what it must, and make sure it hears SIGTERM and shuts down cleanly.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l05-01](m03l05-01/) | Exec form and shell form | Read along |
| [m03l05-02](m03l05-02/) | Stop running the service as root | Checker |
| [m03l05-03](m03l05-03/) | Ownership decides what a non-root user can write | Read along |
| [m03l05-04](m03l05-04/) | ENTRYPOINT fixes the program, CMD supplies defaults | Checker |
| [m03l05-05](m03l05-05/) | Overriding each half from the command line | Read along |
| [m03l05-06](m03l05-06/) | Who receives SIGTERM when the container stops | Read along |
| [m03l05-07](m03l05-07/) | A tiny init process for programs without handlers | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Make a container stop quickly and cleanly

1. Run the task API with -u 0, write into /app, and explain why the image default stopped you.
2. Change the tool image so run arguments are appended to a fixed subcommand you choose.
3. Rewrite CMD in shell form with two commands, then stop the container and time it.
4. Fix it without going back to exec form, using either --init or the exec builtin.

> **Hint:** The exit code after a stop tells you which signal ended the process: subtract one hundred and twenty eight.

## Check yourself

- What is process one inside a container whose CMD is written in shell form, and why does it matter?
- An image has ENTRYPOINT and CMD. What happens to each when you pass arguments after the image name?
- Why does the task API own /data but not /app, and what does that protect against?
- A container stopped with exit code 137. What happened, and how long did docker stop wait?
- What does the init flag add to a container, and which two problems does it solve?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
