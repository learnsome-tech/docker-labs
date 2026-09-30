# m07l01 · Diagnose Crashes, Resource Limits And Unhealthy Containers

Module 7: Operate The Service And Hand Off · lesson 7.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m07l01)

**Goal:** You can reproduce a crash, an out of memory kill, a slow stop, a crash loop and an unhealthy container, and name the cause of each from its exit code, its recorded state, its restart count, its events and its health log.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m07l01-02](m07l01-02/) | A crash and an out of memory kill, side by side | Read along |
| [m07l01-03](m07l01-03/) | Stopped, killed or obeyed: the signal is in the code | Read along |
| [m07l01-04](m07l01-04/) | A crash loop under a restart policy | Read along |
| [m07l01-05](m07l01-05/) | Running, but unhealthy | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Reproduce and explain each failure

1. Run the service with a 48 MB memory limit and no extra swap; confirm it still reports healthy.
2. Break the health check a different way, and find the reason in State.Health.Log.
3. Start a crash loop with --restart always; watch RestartCount and docker events, then remove it.
4. Stop a container whose process one ignores SIGTERM, and time how long docker stop takes.

> **Hint:** Exit codes above 128 are signals: subtract 128 to get the signal number.

## Check yourself

- How do you tell an out of memory kill from a stop that timed out, when both exit with 137?
- Why did the bare sleep container take the whole grace period to stop, while the init one did not?
- What does a restart policy react to, and what does it ignore?
- Where would you look first to explain why a running container is marked unhealthy?
- Why can memory use close to the limit be harmless?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
