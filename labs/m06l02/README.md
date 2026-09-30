# m06l02 · Health Checks, Dependencies And Reliable Startup

Module 6: Compose And Local Development · lesson 6.2 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m06l02)

**Goal:** You can reproduce a startup race, fix it with a HEALTHCHECK, a Compose healthcheck and depends_on conditions, read health status from ps and inspect, and explain why the application must still retry.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m06l02-02](m06l02-02/) | Reproduce the startup race | Read along |
| [m06l02-03](m06l02-03/) | HEALTHCHECK in the build file | Checker |
| [m06l02-04](m06l02-04/) | A database check and depends_on conditions | Checker |
| [m06l02-05](m06l02-05/) | Start in order and wait for healthy | Read along |
| [m06l02-06](m06l02-06/) | What unhealthy looks like, then clean up | Read along |
| [m06l02-07](m06l02-07/) | Readiness is also the application's job | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: break it and read the evidence

1. Point the migrate command at a schema path that does not exist, then run up -d --wait
2. Read the error Compose prints and the exit code of migrate in docker compose ps -a
3. Restore the path, point the Dockerfile health check at port 8001, run up -d --wait again
4. Find the failing check's output with docker inspect, then put everything back and clean up

> **Hint:** The health log lives under .State.Health.Log in docker inspect; wait-timeout shortens the wait.

## Check yourself

- Why did the naive migrate service fail even though its configuration was correct?
- What does the start period change about how failures are counted?
- Which command shows a one shot service that has already exited, and what should its status be?
- Why should a retry loop eventually give up and exit instead of retrying forever?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
