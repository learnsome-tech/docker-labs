# m02l03 · Commands, Logs, Exec And Exit Codes

Module 2: Images And The Container Lifecycle · lesson 2.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m02l03)

**Goal:** You can inspect a running container without rebuilding it, read its logs, execute a diagnostic command, and use exit codes to find the real failure.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m02l03-02](m02l03-02/) | A container that leaves evidence | Read along |
| [m02l03-03](m02l03-03/) | Exec a diagnostic process | Read along |
| [m02l03-04](m02l03-04/) | Exit codes tell the ending | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Diagnose a stopped service

1. Start a detached container that writes a startup line and then exits with a nonzero code.
2. Read its logs and inspect its status and exit code.
3. Use exec only while a container is running, and explain why it cannot enter an exited one.

> **Hint:** Logs survive process exit. Exec needs a live target.

## Check yourself

- What is the difference between logs and inspect?
- Why can exec not enter an exited container?
- Where can you find the main process exit code?
- Why should you capture an exit code before cleanup?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
