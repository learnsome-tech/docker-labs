# Exercises — Commands, Logs, Exec And Exit Codes

Lesson `m02l03` · [Watch](https://learnsome.tech/courses/docker-course/watch?lesson=m02l03)

## Exercise 1: Diagnose a stopped service

1. Start a detached container that writes a startup line and then exits with a nonzero code.
2. Read its logs and inspect its status and exit code.
3. Use exec only while a container is running, and explain why it cannot enter an exited one.

> **Hint**: Logs survive process exit. Exec needs a live target.


---

© LearnSome.tech · support@iwantto.learnsome.tech
