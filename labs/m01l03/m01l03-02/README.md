# m01l03-02 · Build four instructions, then read the stack back

**Lesson:** [Union Filesystems, Images And Writable Layers](https://learnsome.tech/learn/docker-course/m01l03) (lesson 1.3, module 1: Containers From The Ground Up) · Free  
**Check:** Checker

## Goal

You can explain what an image is made of, read the layer history of an image you built, and predict what happens to a file a container writes when that container is removed.

In the lesson: Here is a four line build file, and each line is worth watching. The first starts from another image, so everything Alpine ships is already underneath us. The second makes a directory. The third copies a file in. The fourth records a default command, which changes no files at all. Build it, then read the stack back with the history command. The output is the layers, newest first. Two of them have a size: the directory cost a few kilobytes, the copied file cost a little more. The command layer cost nothing, because metadata is not a file. Below our three lines sit the two layers Alpine itself was built from. Notice the word missing in the identifier column: only the top layer of a local image keeps an identifier of its own.

## Files

- [`starter/Dockerfile`](starter/Dockerfile): the listing from the lesson
- [`starter/note.txt`](starter/note.txt)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Go to the starter: `cd labs/m01l03/m01l03-02/starter`
2. Read `Dockerfile` the way the lesson builds it:
   - Lines 1: starts from another image
   - Lines 2: makes a directory
   - Lines 3: copies a file in
   - Lines 4: records a default command
3. Edit `Dockerfile` and check it: `hadolint Dockerfile`.
4. Check it from the repository root: `./check m01l03-02`.
5. The site offers these commands for this lab; the first is the default, and the only one graded. Run another with `./check m01l03-02 --command=<id>`:
   - `lint` (Lint): `hadolint Dockerfile`
   - `strict` (Lint strictly): `hadolint --failure-threshold info Dockerfile`

## How to check

`./check m01l03-02` copies `starter/` into a scratch directory and runs `hadolint Dockerfile` there, the way the site's lab sandbox does: that directory is the working directory and `HOME`, `LANG=C.UTF-8`, `TZ=UTC`, a limit of 10 seconds and 256 KiB of output per stream.

This is a checker lab: it lints the Dockerfile with hadolint at failure threshold `error`: it passes when hadolint reports no errors (warnings are shown but do not fail it). The site shows the checker's report without grading; `./check` passes when the checker finds no errors.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m01l03) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
