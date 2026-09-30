# m07l02-05 · The same flow as a workflow file

**Lesson:** [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) (lesson 7.2, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Checker

## Goal

You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

In the lesson: Here is the same flow as a GitHub Actions workflow, which runs on every push. The job asks for permission to read the code and write packages, nothing more, and names the image after the commit. Three published actions do the setup: check out the code, set up buildx, and log in to the registry with a token the platform issues for this run only, so no password lives in the repository. The build step loads the image into the runner's Docker instead of pushing it, so the smoke test can run it first. The two cache lines matter because hosted runners start empty every time: cache from and cache to point BuildKit at the Actions cache, and mode max keeps the layers of every stage, not only the last one. The final line pushes only when the test exits with zero, so a failing image never reaches the registry.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/.github/workflows/image.yml`](starter/.github/workflows/image.yml)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/image.yml`](starter/image.yml): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m07l02/m07l02-05/starter`
2. Read `image.yml` the way the lesson builds it:
   - Lines 1–2: runs on every push
   - Lines 3–7: names the image after the commit
   - Lines 8–15: Three published actions
   - Lines 16–19: The build step loads
   - Lines 20–21: The two cache lines
   - Lines 22: only when the test exits with zero
3. Notes from the lesson:
   - Line 15: a token issued for this run only; no stored password
   - Line 18: export to the runner's Docker so the test can run it
   - Line 21: hosted runners start empty: keep layers in the Actions cache
4. Edit `image.yml` and check it: `actionlint image.yml`.
5. Check it from the repository root: `./check m07l02-05`.

## How to check

`./check m07l02-05` copies `starter/` into a scratch directory and runs `actionlint image.yml` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it checks the GitHub Actions workflow with actionlint (its shellcheck and pyflakes integrations are off, as on the site). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
