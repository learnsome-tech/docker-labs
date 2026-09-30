# m03l04 · ARG, ENV, LABEL, EXPOSE And VOLUME

Module 3: Build Images Instruction By Instruction · lesson 3.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l04)

**Goal:** You can decide whether a setting belongs to build time or run time, parameterise a build with ARG, bake runtime defaults in with ENV, describe an image with OCI labels, and explain what EXPOSE and VOLUME really do when a container starts.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l04-02](m03l04-02/) | Build arguments, labels and runtime defaults | Checker |
| [m03l04-03](m03l04-03/) | Reading the settings back out of the image | Read along |
| [m03l04-04](m03l04-04/) | Labels worth setting, and one instruction to stop using | Read along |
| [m03l04-05](m03l04-05/) | EXPOSE documents a port; publishing opens it | Read along |
| [m03l04-06](m03l04-06/) | VOLUME: a mount point that creates volumes | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Parameterise the base image and the version

1. Build the image twice with different version build arguments and compare the labels.
2. Pass 3.13-alpine as the Python tag argument and check which Python the container reports.
3. Add a revision label fed from a commit build argument and read it back with inspect.
4. Move the version ARG above the first RUN, change its value, rebuild, and watch the cache.

> **Hint:** Build arguments go on the build command with the build arg flag; labels come back through inspect with a Go template.

## Check yourself

- Why does a container print nothing for the Python tag argument, yet print the version?
- An ARG is declared before FROM. What must you do to use its value in a RUN instruction?
- What does EXPOSE change when you run the image without any publish flag?
- Why is a password passed as a build argument still a leak, even if no file contains it?
- Where does data go when a container writes to a directory its image declared with VOLUME?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
