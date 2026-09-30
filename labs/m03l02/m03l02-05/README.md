# m03l02-05 · ADD unpacks local archives; COPY does not

**Lesson:** [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) (lesson 3.2, module 3: Build Images Instruction By Instruction) · Pro  
**Check:** Checker

## Goal

You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

In the lesson: The add instruction looks like copy with extra powers, and the powers are the problem. This build uses a small Alpine image and a compressed tar archive from the course files. The copy instruction takes the archive as it is. The add instruction recognises the archive by its content, not its name, and unpacks it. Build and list, and the difference is plain: one archive, one extracted directory. Add can also download a file from the web, or pull in a whole source repository, straight into the image, and a downloaded archive is not unpacked unless you ask. That is a lot of behaviour behind one word. The official guidance is copy for files from the context, and add only when you want one of those extras: an archive unpacked, or a remote download pinned with a checksum.

## Files

- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/add.Dockerfile`](starter/add.Dockerfile): the listing from the lesson
- [`starter/app.py`](starter/app.py)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/setup.sh`](starter/setup.sh)
- [`starter/sitecfg.tar.gz`](starter/sitecfg.tar.gz)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m03l02/m03l02-05/starter`
2. Read `add.Dockerfile` the way the lesson builds it:
   - Lines 1–2: a small Alpine image
   - Lines 3: copy instruction takes the archive
   - Lines 4: add instruction
3. Edit `add.Dockerfile` and check it: `hadolint add.Dockerfile`.
4. Check it from the repository root: `./check m03l02-05`.

## How to check

`./check m03l02-05` copies `starter/` into a scratch directory and runs `hadolint add.Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m03l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
