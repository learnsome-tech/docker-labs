# m03l02 · FROM, WORKDIR, COPY And ADD

Module 3: Build Images Instruction By Instruction · lesson 3.2 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l02)

**Goal:** You can choose and pin a base image, predict exactly where WORKDIR and COPY put each file and who owns it, know the one job ADD does that COPY does not, and recognise an ONBUILD trigger inherited from a base image.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l02-01](m03l02-01/) | FROM chooses the filesystem you start with | Read along |
| [m03l02-02](m03l02-02/) | Where each file lands: WORKDIR and COPY paths | Read along |
| [m03l02-04](m03l02-04/) | Ownership and permissions are set at copy time | Read along |
| [m03l02-05](m03l02-05/) | ADD unpacks local archives; COPY does not | Checker |
| [m03l02-06](m03l02-06/) | ONBUILD: an instruction that waits for a child image | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Predict, then prove

1. Before building, write down where each COPY in the lesson Dockerfile will put app.py.
2. Build it and compare your prediction with a sorted find of the image.
3. Copy app.py to a directory destination with --chown=10001 and check the owner.
4. Build a base with an ONBUILD trigger, then a child, and list what the trigger added.

> **Hint:** A destination without a leading slash is resolved against the current WORKDIR.

## Check yourself

- Why is a base image with no tag a risk to a build that worked yesterday?
- Where does COPY app.py backup put the file, and how would you make backup a directory?
- Why set ownership with the copy instruction instead of in a later step?
- What does ADD do with a local archive that COPY does not?
- When does an ONBUILD trigger run, and in whose build context?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
