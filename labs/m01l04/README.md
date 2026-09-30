# m01l04 · Docker, OCI, The Engine And The CLI

Module 1: Containers From The Ground Up · lesson 1.4 · Free · [Open the lesson](https://learnsome.tech/learn/docker-course/m01l04)

**Goal:** You can describe what happens between typing a docker command and a container running, name the three OCI specifications, and explain why removing Docker from Kubernetes did not break your images.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m01l04-02](m01l04-02/) | Asking the engine about itself | Read along |
| [m01l04-04](m01l04-04/) | An image declares what it is built for | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Follow the request down

1. Ask your engine for its default runtime and its storage driver, and write both down.
2. Ask the alpine image which operating system and architecture it declares.
3. Say which of the four programs pulls images and which makes the kernel calls.

> **Hint:** One of the four never leaves your terminal, and one of them exits as soon as your process is running.

## Check yourself

- Which of the four programs owns the images and containers on your machine?
- What does the runtime specification describe, and what does the distribution specification describe?
- Why does the server report Linux even when your laptop is not running Linux?
- What exactly was removed from Kubernetes in version one point twenty four, and what carried on working?
- Where does the default command of an image come from, and what reads it?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
