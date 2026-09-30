# m04l03-04 · Same work, one layer

**Lesson:** [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) (lesson 4.3, module 4: Registries, Image Size And Security) · Pro  
**Check:** Checker

## Goal

You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

In the lesson: The fix is to create and remove temporary files in the same instruction. Here the write and the delete are joined with two ampersands in the same instruction, with a backslash continuing it onto the next line, so the layer is recorded only after the file is already gone. The history now shows that step costing four kilobytes instead of forty two megabytes, and the finished image is the size of Alpine itself. The same rule applies to real builds: download, install and clean the package cache in one instruction, or use the package manager's no cache option. When the leftovers are a whole compiler rather than one file, joining commands stops being enough, and the better tool is a multi stage build, which is next.

## Files

- [`starter/fat.Dockerfile`](starter/fat.Dockerfile)
- [`starter/lean.Dockerfile`](starter/lean.Dockerfile): the listing from the lesson
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m04l03/m04l03-04/starter`
2. Read `lean.Dockerfile` the way the lesson builds it:
   - Lines 1–3: same instruction
3. Edit `lean.Dockerfile` and check it: `hadolint lean.Dockerfile`.
4. Check it from the repository root: `./check m04l03-04`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m04l03-04 --command=<id>`:
   - `lint` (Lint): `hadolint lean.Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info lean.Dockerfile`

## How to check

`./check m04l03-04` copies `starter/` into a scratch directory and runs `hadolint lean.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
