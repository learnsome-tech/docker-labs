# m03l06 · Multi Stage Builds, Targets And Build Secrets

Module 3: Build Images Instruction By Instruction · lesson 3.6 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l06)

**Goal:** You can split a build into stages so the toolchain never ships, build a single stage on purpose with a target, pass a secret to one build step without it reaching the image, history or logs, and read the task API's finished Dockerfile line by line.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l06-02](m03l06-02/) | Build in one stage, ship from another | Checker |
| [m03l06-03](m03l06-03/) | What shipped, what stayed behind, and targets | Read along |
| [m03l06-04](m03l06-04/) | The wrong way to hand a build a token | Checker |
| [m03l06-05](m03l06-05/) | The right way: a secret mount for one step | Checker |
| [m03l06-06](m03l06-06/) | Proving where the token went | Read along |
| [m03l06-08](m03l06-08/) | The task API's finished Dockerfile | Checker |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Stages, targets and a secret of your own

1. Swap the worker's final stage for scratch, rebuild, and compare the size and the history.
2. Make the release stage depend on the test stage so a failing check stops the build.
3. Pass a secret from a file with src= and read it in a RUN step without printing it.
4. Rebuild after changing the secret's value and note which steps the cache reused.

> **Hint:** COPY --from can name the test stage; copying its report file into release creates the dependency.

## Check yourself

- Which stage becomes the image when you build without the target flag, and what happens to the others?
- Why did the test stage not run during the default build, and how would you make it run every time?
- Where does a secret mount put the secret, and for how long does it exist?
- Name two places a token passed as a build argument can be read afterwards.
- Why does the task API's reference file use a single stage when the worker uses three?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
