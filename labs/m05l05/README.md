# m05l05 · Environment, Secret Files And Runtime Restrictions

Module 5: Data, Networks And Runtime Configuration · lesson 5.5 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m05l05)

**Goal:** You can configure one image differently per run with -e and --env-file, deliver a secret as a read-only file instead of an environment variable, and run the task API with a read-only filesystem, no capabilities, no privilege escalation and resource limits.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m05l05-02](m05l05-02/) | Override the image's defaults at run time | Read along |
| [m05l05-04](m05l05-04/) | The same password, as a variable and as a file | Read along |
| [m05l05-06](m05l05-06/) | The task API with everything unneeded taken away | Read along |
| [m05l05-07](m05l05-07/) | Prove each restriction from inside | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: configure, hide a secret, lock it down

1. Run the task API with --env-file and -e both setting the version; which one wins?
2. Mount a secret file read-only and show docker inspect does not contain its value.
3. Remove --tmpfs /tmp from run-locked.sh and find a command inside that now fails.
4. Lower --memory until the container is killed and read its exit code with docker ps -a.

> **Hint:** docker inspect -f '{{.State.OOMKilled}}' tells you whether the kernel killed it.

## Check yourself

- Where should a port number live, where should a database password live, and why are those different answers?
- If ENV, --env-file and -e all set the same variable, which value does the container see?
- What could an attacker do inside the task API container before the restrictions that they cannot do after?
- Which restriction would you expect to break an application first, and how would you find out?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
