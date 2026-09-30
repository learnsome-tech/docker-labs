# m07l03-05 · Prove the user, the filesystem and the limits

**Lesson:** [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) (lesson 7.3, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

In the lesson: Bring the stack up and wait until both services report healthy. Keep a shorthand for running a command inside the api service, then repeat the audit. The user is unchanged. Writing to the home directory now fails with read only file system, while the temporary directory and the data volume are still writable, which is exactly the split you asked for. The bounding set is all zeros, and no new privileges is on. The memory limit reads one hundred and twenty eight megabytes, in bytes, and the process limit reads sixty four. Last, a request through the published port, eighteen thousand seven hundred and three, answers with status ok. That is the point of the exercise: none of these controls cost the service anything it needed, and each one is now a fact you have observed rather than a line you hope works.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/secrets/db_password.txt`](starter/secrets/db_password.txt)
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker compose --progress quiet up -d --wait
   docker compose ps --format '{{.Service}} {{.Status}}'
   api="docker compose exec api"
   $api id
   $api touch /home/app/x
   $api touch /tmp/x /data/x && echo writable
   $api grep -E 'CapBnd|NoNewPrivs|Seccomp:' /proc/1/status
   $api cat /sys/fs/cgroup/memory.max /sys/fs/cgroup/pids.max
   curl -s localhost:18703/health; echo
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l03-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
