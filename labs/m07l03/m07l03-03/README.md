# m07l03-03 · The hardened service

**Lesson:** [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) (lesson 7.3, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

In the lesson: Here is the same service as module six left it, with the controls added one per line. The project name keeps every resource prefixed with this lesson's id. The root filesystem is read only; the named volume for its data stays writable, and a memory backed temporary directory covers the programs that insist on a scratch space. The next two lines drop every capability and set no new privileges, so even a set user binary cannot raise its rights. The limits give it half a processor, one hundred and twenty eight megabytes and sixty four processes, which is plenty for this service and a hard stop for a leak or a fork bomb. The restart policy is unless stopped. The grace period gives the shutdown handler twenty seconds before the kill signal. And the service waits for the database to report healthy before it starts.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml): the listing from the lesson
- [`starter/secrets/db_password.txt`](starter/secrets/db_password.txt)
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l03/m07l03-03/starter`
2. Read `compose.yaml` the way the lesson builds it:
   - Lines 1–7: the same service
   - Lines 8–9: read only
   - Lines 10–11: drop every capability
   - Lines 12–14: half a processor
   - Lines 15–16: unless stopped
   - Lines 17–18: waits for the database
3. Notes from the lesson:
   - Line 9: a memory-backed scratch directory, empty at every start
   - Line 11: setuid programs cannot raise privileges
   - Line 16: time between the stop signal and the kill signal
4. Edit `compose.yaml` and check it: `yamllint compose.yaml`.
5. Check it from the repository root: `./check m07l03-03`.

## How to check

`./check m07l03-03` copies `starter/` into a scratch directory and runs `yamllint compose.yaml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the YAML with yamllint's `relaxed` rules: it passes when there are no errors. The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
