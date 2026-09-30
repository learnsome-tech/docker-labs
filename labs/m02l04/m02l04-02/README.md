# m02l04-02 · The spine service image

**Lesson:** [Run The Spine Service And Publish Its Port](https://learnsome.tech/learn/docker-course/m02l04) (lesson 2.4, module 2: Images And The Container Lifecycle) · Pro  
**Check:** Checker

## Goal

You can run the course service from its image, publish its listening port, test it from the host, and cleanly stop the service when the test is done.

In the lesson: Here is the small service that carries us through the rest of the course. The Dockerfile chooses a Python base, creates an application directory, copies the service file, and starts it with the Python interpreter. The context is the task API directory shipped with the course, so the file on screen is a contiguous slice of the real build input. Build it with a short tag. The dots hide the builder's progress and the final line confirms that the tag now points at the image. Later lessons will make this same image smaller, safer and easier to develop against. For now, we only need a service that can answer one request.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m02l04/m02l04-02/starter`
2. Read `Dockerfile`.
3. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
4. Check it from the repository root: `./check m02l04-02`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m02l04-02 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m02l04-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m02l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
