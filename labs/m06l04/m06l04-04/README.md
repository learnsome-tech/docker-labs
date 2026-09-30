# m06l04-04 · The smoke test itself

**Lesson:** [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) (lesson 6.4, module 6: Compose And Local Development) · Pro  
**Check:** Read along

## Goal

You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

In the lesson: The test is a plain shell script, which keeps the idea visible; a real suite would use a test framework in its own image, run exactly the same way. The set line makes it stop at the first failure and treat unset variables as errors, so any failing command becomes a non zero exit. Each check prints what it is about to prove, then proves it. The first check fetches the health endpoint and searches the reply for an ok status. The second check posts a task and expects to find it in the list. The third check asks the database how many tasks it holds, and expects exactly the two seed rows. Only if everything passes does the last line print.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/extra.sql`](starter/extra.sql)
- [`starter/seed.sql`](starter/seed.sql)
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/smoke.sh`](starter/smoke.sh): the listing from the lesson
- [`starter/tests/smoke.sh`](starter/tests/smoke.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/smoke.sh` alongside the lesson.
2. Follow it the way the lesson builds it:
   - Lines 1–3: stop at the first failure
   - Lines 4–6: The first check
   - Lines 7–10: The second check
   - Lines 11–14: The third check
   - Lines 15–16: the last line

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m06l04-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m06l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
