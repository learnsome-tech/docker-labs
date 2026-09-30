# m02l01 · Pull And Inspect A Third Party Image

Module 2: Images And The Container Lifecycle · lesson 2.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m02l01)

**Goal:** You can pull a trusted image, read its metadata, and explain which parts of an image are content and which parts are a mutable runtime choice.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m02l01-02](m02l01-02/) | Pull a small image | Read along |
| [m02l01-03](m02l01-03/) | Inspect metadata, not guesses | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Read an image before running it

1. Pull a small official image and record its repository, tag and architecture.
2. Inspect its default command and its configured working directory.
3. Compare the short image identifier with its full content digest.

> **Hint:** A tag is a label. The digest is the identity.

## Check yourself

- What is the difference between an image tag and an image digest?
- What does image inspection tell you that image listing does not?
- Why can deleting a file in a later image layer leave its bytes behind?
- Which defaults are assumed when a registry or namespace is omitted?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
