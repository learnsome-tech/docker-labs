# m01l02 · Namespaces And Cgroups: Isolation And Limits

Module 1: Containers From The Ground Up · lesson 1.2 · Free · [Open the lesson](https://learnsome.tech/learn/docker-course/m01l02)

**Goal:** You can name the kernel features that make a container, read a container's namespace identifiers and control group limits from a shell, and explain which of the two does isolation and which does resource control.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m01l02-02](m01l02-02/) | Every namespace the kernel offers, on one process | Read along |
| [m01l02-03](m01l02-03/) | Sharing a namespace with the host, on purpose | Read along |
| [m01l02-05](m01l02-05/) | Control groups: the limit is a file | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Prove the limit is real

1. Start a container with a memory limit of sixteen megabytes and read the memory maximum file.
2. Start the same image with no limit and read the same file. Write both answers down.
3. Run a container with the host process namespace and count how many processes it can see.

> **Hint:** The limit file lives under the system filesystem control group directory, and it is in bytes.

## Check yourself

- Which kernel feature decides what a container can see, and which decides how much it can use?
- What does the number in square brackets after a namespace name actually tell you?
- What did the host process namespace flag change, given that the image was identical?
- Where does the memory limit you pass on the command line end up, and in what unit?
- Why is a shared kernel the ceiling on how strong container isolation can be?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
