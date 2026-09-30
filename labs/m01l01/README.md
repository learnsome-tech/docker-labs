# m01l01 · Why Containers: Bare Metal, Machines And Processes

Module 1: Containers From The Ground Up · lesson 1.1 · Free · [Open the lesson](https://learnsome.tech/learn/docker-course/m01l01)

**Goal:** You can explain what a container actually is, how it differs from a virtual machine, and why packaging the environment with the program removes a whole class of deployment failure.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m01l01-03](m01l01-03/) | A container is a process, not a machine | Read along |
| [m01l01-04](m01l01-04/) | One kernel underneath, different userlands on top | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Count the processes

1. Run a container from the alpine image and print its process list with the p s command.
2. Now open a terminal on your own machine and count the processes there.
3. Explain the difference in one sentence, without using the word lightweight.

> **Hint:** One of the two booted an operating system before you arrived. The other did not.

## Check yourself

- What does a virtual machine have that a container does not?
- Why can an Alpine container and a Debian container run at the same time on one kernel?
- Why does a container start in well under a second when a virtual machine takes tens of seconds?
- Name one case where a virtual machine boundary is the right answer and a container is not.
- What does it mean to say that a container is a process that has been lied to?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
