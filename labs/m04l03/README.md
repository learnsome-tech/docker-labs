# m04l03 · Minimal Bases, Non Root Users And Smaller Images

Module 4: Registries, Image Size And Security · lesson 4.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m04l03)

**Goal:** You can choose a base image deliberately, find and remove the layers that make an image fat, ship a compiled program on a distroless base, and prove the service runs as an unprivileged user.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m04l03-02](m04l03-02/) | Compare the bases on your machine | Read along |
| [m04l03-03](m04l03-03/) | A layer that deletes nothing | Checker |
| [m04l03-04](m04l03-04/) | Same work, one layer | Checker |
| [m04l03-05](m04l03-05/) | Compile in one stage, ship on distroless | Checker |
| [m04l03-07](m04l03-07/) | Prove who the process is | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Shrink it and drop root

1. Build fat.Dockerfile, find the heavy layer with docker history, and fix it in one RUN.
2. Build the Go worker onto scratch instead of distroless and compare size and user.
3. Run the service image as its own user and as --user 0, and write down the difference.
4. Change the service's USER line to the numeric 10001 and confirm id still reports app.

> **Hint:** On scratch there is no passwd file, so USER needs a number rather than a name.

## Check yourself

- Why does deleting a file in a later RUN instruction leave the image just as large?
- What does a distroless image leave out, and what does that cost you when debugging?
- Which layer in the service's own history is the largest, and where does it come from?
- Why is a USER instruction not enough on its own to guarantee a container never runs as root?
- Why does Kubernetes prefer a numeric user in the image over a user name?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
