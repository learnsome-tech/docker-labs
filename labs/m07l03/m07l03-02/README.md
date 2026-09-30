# m07l03-02 · Audit the image as it runs by default

**Lesson:** [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) (lesson 7.3, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

In the lesson: Start with an audit of what the image does on its own, with a plain run and no options. Build the service image from this lesson's context. The user is already right: user ten thousand and one, the non root account from module three. But everything else is a default. The process can write anywhere it owns, such as its home directory. The capability bounding set is Docker's default list of fourteen, and no new privileges is off, so a set user program could still raise its rights. There is no memory limit and no process limit: both files say max. One line in this Dockerfile is new, though. The stop signal instruction names the signal that docker stop sends. The termination signal is already the default, but writing it down documents the contract that the service's shutdown handler relies on.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/secrets/db_password.txt`](starter/secrets/db_password.txt)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   docker build -q -t m07l03-api:1.0.0 . >/dev/null
   base="docker run --rm m07l03-api:1.0.0"
   $base id
   $base touch /home/app/x && echo writable
   $base grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
   $base cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
   docker inspect -f '{{.Config.StopSignal}}' m07l03-api:1.0.0
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l03-02` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
