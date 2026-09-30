# m01l03 · Union Filesystems, Images And Writable Layers

Module 1: Containers From The Ground Up · lesson 1.3 · Free · [Open the lesson](https://learnsome.tech/learn/docker-course/m01l03)

**Goal:** You can explain what an image is made of, read the layer history of an image you built, and predict what happens to a file a container writes when that container is removed.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m01l03-02](m01l03-02/) | Build four instructions, then read the stack back | Checker |
| [m01l03-03](m01l03-03/) | Filesystem layers, counted | Read along |
| [m01l03-05](m01l03-05/) | Two containers, one image, separate writes | Read along |

## Check yourself

- Why does the history command show five entries when the image has three filesystem layers?
- What happens on disk when a container writes to a file that came from the image?
- Why is a secret you added and then deleted in a later instruction still in the image?
- Two containers run from one image and one of them writes a file. What does the other see?
- Why does the order of instructions in a build file affect how long a rebuild takes?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
