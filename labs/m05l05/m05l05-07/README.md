# m05l05-07 · Prove each restriction from inside

**Lesson:** [Environment, Secret Files And Runtime Restrictions](https://learnsome.tech/learn/docker-course/m05l05) (lesson 5.5, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can configure one image differently per run with -e and --env-file, deliver a secret as a read-only file instead of an environment variable, and run the task API with a read-only filesystem, no capabilities, no privilege escalation and resource limits.

In the lesson: Run the script, and first check the one thing that matters most: the service still works. Posting a task succeeds, because the volume is writable and nothing else needed to be. Now prove each restriction from inside. Try to change its own program, and the read only file system refuses. Read the capability bounding set of process one: all zeros, so not even root in there could regain a capability. The no new privileges flag reads one. The process limit file says sixty four. And one snapshot from the stats command shows memory use against the limit, a few megabytes out of one hundred and twenty eight. Every one of these is a kernel feature you met in module one, switched on with a flag. Clean up the container and the volume.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run-locked.sh`](starter/run-locked.sh)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   sh run-locked.sh; sleep 2
   curl -sd '{"title":"locked"}' localhost:18505/tasks; echo
   docker exec m05l05-api touch /app/x
   docker exec m05l05-api grep CapBnd /proc/1/status
   docker exec m05l05-api grep NoNewPrivs /proc/1/status
   docker exec m05l05-api cat /sys/fs/cgroup/pids.max
   docker stats --no-stream --format '{{.MemUsage}}' m05l05-api
   docker rm -f m05l05-api && docker volume rm m05l05-data
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m05l05-07` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
