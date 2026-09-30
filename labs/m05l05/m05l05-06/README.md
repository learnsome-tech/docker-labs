# m05l05-06 · The task API with everything unneeded taken away

**Lesson:** [Environment, Secret Files And Runtime Restrictions](https://learnsome.tech/learn/docker-course/m05l05) (lesson 5.5, module 5: Data, Networks And Runtime Configuration) · Pro  
**Check:** Read along

## Goal

You can configure one image differently per run with -e and --env-file, deliver a secret as a read-only file instead of an environment variable, and run the task API with a read-only filesystem, no capabilities, no privilege escalation and resource limits.

In the lesson: Put the whole policy in one command, in a script, so it is written down and reviewable. Start with the name. Then a read only root, with a tmpfs mount at slash temp. Then drop every capability, forbid new privileges, and pin user and group ten thousand and one, the same user the image already declares, now enforced from outside. Next come the three limits: one hundred and twenty eight megabytes of memory, half a processor, and at most sixty four processes, which stops a fork bomb cold. The named volume at slash data is the only writable path the service keeps, which is exactly the one it needs. Finally, publish on port eighteen thousand five hundred and five and name the image.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run-locked.sh`](starter/run-locked.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/run-locked.sh` alongside the lesson.
2. Follow it the way the lesson builds it:
   - Lines 1–3: one command
   - Lines 4: read only root
   - Lines 5–7: drop every capability
   - Lines 8: the three limits
   - Lines 9–11: the only writable path
3. Notes from the lesson:
   - Line 4: image files are immutable; /tmp lives in memory
   - Line 5: root in here would keep no kernel privileges at all
   - Line 8: control group limits: memory, half a processor, 64 processes
   - Line 9: the one path the service may write

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m05l05-06` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m05l05) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
