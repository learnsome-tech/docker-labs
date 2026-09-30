# m03l01 · Build Context, Dockerignore And Your First Dockerfile

Module 3: Build Images Instruction By Instruction · lesson 3.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l01)

**Goal:** You can write a four line Dockerfile for the task API, say exactly which files a build can read, keep secrets and junk out of the build context with a .dockerignore file, and choose the Dockerfile and the context independently.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l01-02](m03l01-02/) | Four lines that turn the service into an image | Checker |
| [m03l01-03](m03l01-03/) | A real project directory is never this tidy | Read along |
| [m03l01-04](m03l01-04/) | Copy everything, and you get everything | Checker |
| [m03l01-05](m03l01-05/) | A .dockerignore file keeps them out | Read along |
| [m03l01-07](m03l01-07/) | The file flag and the context are separate choices | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Prove what your build can see

1. Build the four line task API image and list the files in its working directory.
2. Add a notes.md file and a tmp folder, then list the whole context with a probe image.
3. Write a .dockerignore that hides both, and prove it with the same listing.
4. Ignore every .md file except guide.md, then check which markdown files arrive.

> **Hint:** The last matching line wins, so the exception must come after the rule it overrides.

## Check yourself

- Which files can a copy instruction read, and who decides that?
- Why did the scratch data never reach the builder in the first build?
- What changed in the probe listing after you added the ignore file, and why?
- What does the file flag choose, and what does the last argument choose?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
