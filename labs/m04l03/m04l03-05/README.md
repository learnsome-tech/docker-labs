# m04l03-05 · Compile in one stage, ship on distroless

**Lesson:** [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) (lesson 4.3, module 4: Registries, Image Size And Security) · Pro  
**Check:** Checker

## Goal

You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

In the lesson: Module three introduced multi stage builds; here they pay for themselves. The small worker program from that module compiles in a build stage on the Go image, which is over three hundred megabytes of compiler and tools. Turning off the C toolchain makes the binary statically linked, so it needs no libraries at run time. The final stage starts from the distroless static image and copies in only that one binary. Everything in the first stage is thrown away. The user instruction switches to the unprivileged account distroless provides, and the entry point runs the worker directly, because there is no shell to run it through. The result is under ten megabytes on disk, and about two to download.

## Files

- [`starter/fat.Dockerfile`](starter/fat.Dockerfile)
- [`starter/go.Dockerfile`](starter/go.Dockerfile): the listing from the lesson
- [`starter/lean.Dockerfile`](starter/lean.Dockerfile)
- [`starter/main.go`](starter/main.go)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m04l03/m04l03-05/starter`
2. Read `go.Dockerfile` the way the lesson builds it:
   - Lines 1–4: build stage
   - Lines 5–9: final stage
3. Notes from the lesson:
   - Line 4: static binary: no C library needed at run time
   - Line 8: distroless ships a nonroot user, uid 65532
4. Edit `go.Dockerfile` and check it: `hadolint go.Dockerfile`.
5. Check it from the repository root: `./check m04l03-05`.
6. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m04l03-05 --command=<id>`:
   - `lint` (Lint): `hadolint go.Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info go.Dockerfile`

## How to check

`./check m04l03-05` copies `starter/` into a scratch directory and runs `hadolint go.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
