# m05l02 · Bind Mounts, Permissions And Backups

Module 5: Data, Networks And Runtime Configuration · lesson 5.2 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m05l02)

**Goal:** You can bind-mount a host directory read-write or read-only, explain and fix a numeric user ID mismatch between a container and its mount, and back up and restore a named volume with a throwaway container and tar.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m05l02-01](m05l02-01/) | Bind mounts: a host path you choose | Read along |
| [m05l02-02](m05l02-02/) | The service writes straight into your folder | Read along |
| [m05l02-03](m05l02-03/) | Read-only mounts, and a source that does not exist | Read along |
| [m05l02-05](m05l02-05/) | A permission mismatch you can reproduce anywhere | Read along |
| [m05l02-06](m05l02-06/) | A backup script that works for any volume | Read along |
| [m05l02-07](m05l02-07/) | Back up, lose and restore a volume | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: mount, protect and recover

1. Bind-mount a host directory read-only and show that the container cannot write to it.
2. Run the service on a volume named m05l02-mine, post two tasks, and back it up with vol.sh.
3. Delete the volume, restore it, and post a third task to prove ownership came back too.
4. On a Linux host, reproduce permission denied with a bind mount, then fix it with chown.

> **Hint:** stat -c %u prints the numeric owner of a path, which is what the kernel compares.

## Check yourself

- What is the practical difference between a bind mount and a named volume, and when would you choose each?
- Why does -v ./typo:/data succeed while the equivalent --mount command fails?
- Why can the same bind mount work on Docker Desktop and fail with permission denied on a Linux server?
- Why does the backup script stop the service before running tar, and why does it mount the volume read-only?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
