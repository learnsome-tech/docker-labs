# m03l03 · RUN, SHELL And Efficient Layer Caching

Module 3: Build Images Instruction By Instruction · lesson 3.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m03l03)

**Goal:** You can use RUN in shell and exec form, change the build shell with SHELL so pipes fail properly, read which steps a rebuild took from the cache, and order a Dockerfile so everyday code edits rebuild only the last few layers.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m03l03-02](m03l03-02/) | Two RUN steps give the service a user and a data directory | Checker |
| [m03l03-03](m03l03-03/) | Shell form and exec form, side by side | Checker |
| [m03l03-04](m03l03-04/) | SHELL, and a pipe that hides a failure | Checker |
| [m03l03-05](m03l03-05/) | How the build cache decides what to reuse | Read along |
| [m03l03-06](m03l03-06/) | Watch the cache: touch, edit, rebuild | Read along |
| [m03l03-08](m03l03-08/) | Cache mounts, and forcing a clean rebuild | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Make a rebuild cheap

1. Build the lesson Dockerfile, then count cached steps after touch and after a real edit.
2. Move COPY app.py . above the adduser step and repeat: which steps rerun now?
3. Add SHELL ["/bin/sh", "-o", "pipefail", "-c"] and make a failing pipe stop the build.
4. Rebuild with --no-cache and confirm that no step is reported as cached.

> **Hint:** Use the plain progress output, and look for the steps that are marked as done.

## Check yourself

- What does the builder do with the filesystem changes a run step makes?
- Why did the exec form create a file with a dollar sign in its name?
- Why did touching the source file not rebuild the copy step?
- Why did the data directory step rerun after an edit, although its command did not change?
- Where do dependency installs belong in a Dockerfile, and why?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
