# m07l02-06 · Promotion as its own gated workflow

**Lesson:** [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) (lesson 7.2, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

In the lesson: Promotion lives in a separate workflow, started by a person or by another pipeline, with two inputs: which commit, and which environment. The environment line is what turns it into a gate. The hosting platform can require an approval before any job that names production runs, and it keeps a history of who promoted what, and when. This job has no checkout step and no build step. It logs in, then runs the same image tools create command you ran by hand, copying a tag onto an existing digest. Notice that the inputs reach the command through environment variables rather than being pasted into the script, so a strange value typed into the commit field cannot become a shell command. Rolling back is this same workflow, run with an older commit.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/.github/workflows/image.yml`](starter/.github/workflows/image.yml)
- [`starter/.github/workflows/promote.yml`](starter/.github/workflows/promote.yml)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/promote.yml`](starter/promote.yml): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l02/m07l02-06/starter`
2. Read `promote.yml` the way the lesson builds it:
   - Lines 1–6: two inputs
   - Lines 7–10: The environment line
   - Lines 11–18: It logs in
   - Lines 19–22: the same image tools create command
3. Notes from the lesson:
   - Line 10: an environment can require an approval before this job runs
   - Line 20: inputs pass through variables, never pasted into the script
4. Edit `promote.yml` and check it: `actionlint promote.yml`.
5. Check it from the repository root: `./check m07l02-06`.

## How to check

`./check m07l02-06` copies `starter/` into a scratch directory and runs `actionlint promote.yml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it checks the GitHub Actions workflow with actionlint (its shellcheck and pyflakes integrations are off, as on the site). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
