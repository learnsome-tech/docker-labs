# m06l03 · Development Overrides, Hot Reloading And Debuggers

Module 6: Compose And Local Development · lesson 6.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m06l03)

**Goal:** You can keep development-only settings in compose.override.yaml, predict how Compose merges files, see code changes land in a running container with compose watch, keep tools behind a profile, and expose a debugger safely.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m06l03-02](m06l03-02/) | Two files, one merged project | Read along |
| [m06l03-03](m06l03-03/) | The override for the API | Checker |
| [m06l03-04](m06l03-04/) | Start the dev stack and edit code live | Read along |
| [m06l03-05](m06l03-05/) | A database shell behind a profile | Checker |
| [m06l03-06](m06l03-06/) | Use the tool, then clean up | Read along |
| [m06l03-07](m06l03-07/) | Debuggers: a port only your machine can reach | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: a second override

1. Write compose.ci.yaml setting the version variable to ci; view it with -f ... -f ... config
2. Check whether the loopback port from compose.override.yaml is in that output, and explain why
3. Add a sync rule for a new notes.txt, start watch, edit the file, then look inside the container
4. Clean up: kill the watcher, docker compose down -v, and remove the image

> **Hint:** With -f, only the files you list are read. docker compose exec api ls /app shows what watch synced.

## Check yourself

- What changes about file discovery the moment you pass -f to docker compose?
- How do environment, volumes and ports each merge when two files define them?
- When would you choose sync, sync+restart or rebuild for a watch rule?
- Why must a debugger listen on all interfaces inside the container but not on the host?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
