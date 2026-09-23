<img src="https://learnsome.tech/logo.png" width="48" alt="LearnSome.tech">

# Docker Architecture & Production Containers

A complete Docker course as IDE-style videos, plus a written companion built from the same scripts. 7 modules, 32 lessons, five to ten minutes each.

## Watch and read

- **Course page**: [https://learnsome.tech/courses/docker-course](https://learnsome.tech/courses/docker-course)
- **Video player**: [https://learnsome.tech/courses/docker-course/watch](https://learnsome.tech/courses/docker-course/watch)
- **Handbook PDF**: [https://learnsome.tech/handbooks/docker/book.pdf](https://learnsome.tech/handbooks/docker/book.pdf)
- **On-site handbook**: [https://learnsome.tech/courses/docker-course/book](https://learnsome.tech/courses/docker-course/book)

## What is in this repository

This repository contains code artifacts, exercises and reference files for the lessons in this course.
32 lessons include a `labs/<lessonId>/` folder.
Each folder is named after the lesson identifier (e.g. `labs/m01l01/`) and contains the
artifact files shown in the course video, an `EXERCISES.md` with hands-on tasks, and
sub-directories named by artifact reference (e.g. `m01l01-02/`).

## Lessons

| # | Lesson | Watch | Labs | Handbook |
|---|--------|-------|------|----------|
| | **Containers From The Ground Up** | | | |
| 1 | Why Containers: Bare Metal, Machines And Processes | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m01l01) | [labs/m01l01/](labs/m01l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-1-1) |
| 2 | Namespaces And Cgroups: Isolation And Limits | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m01l02) | [labs/m01l02/](labs/m01l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-1-2) |
| 3 | Union Filesystems, Images And Writable Layers | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m01l03) | [labs/m01l03/](labs/m01l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-1-3) |
| 4 | Docker, OCI, The Engine And The CLI | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m01l04) | [labs/m01l04/](labs/m01l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-1-4) |
| 5 | Install Docker And Verify Your Environment | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m01l05) | [labs/m01l05/](labs/m01l05/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-1-5) |
| | **Images And The Container Lifecycle** | | | |
| 6 | Pull And Inspect A Third Party Image | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m02l01) | [labs/m02l01/](labs/m02l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-2-1) |
| 7 | Run, Stop, Restart And Remove A Container | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m02l02) | [labs/m02l02/](labs/m02l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-2-2) |
| 8 | Commands, Logs, Exec And Exit Codes | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m02l03) | [labs/m02l03/](labs/m02l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-2-3) |
| 9 | Run The Spine Service And Publish Its Port | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m02l04) | [labs/m02l04/](labs/m02l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-2-4) |
| | **Build Images Instruction By Instruction** | | | |
| 10 | Build Context, Dockerignore And Your First Dockerfile | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l01) | [labs/m03l01/](labs/m03l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-1) |
| 11 | FROM, WORKDIR, COPY And ADD | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l02) | [labs/m03l02/](labs/m03l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-2) |
| 12 | RUN, SHELL And Efficient Layer Caching | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l03) | [labs/m03l03/](labs/m03l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-3) |
| 13 | ARG, ENV, LABEL, EXPOSE And VOLUME | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l04) | [labs/m03l04/](labs/m03l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-4) |
| 14 | CMD, ENTRYPOINT, USER And Process Signals | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l05) | [labs/m03l05/](labs/m03l05/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-5) |
| 15 | Multi Stage Builds, Targets And Build Secrets | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m03l06) | [labs/m03l06/](labs/m03l06/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-3-6) |
| | **Registries, Image Size And Security** | | | |
| 16 | Tags, Digests And Reproducible Image References | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m04l01) | [labs/m04l01/](labs/m04l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-4-1) |
| 17 | Authenticate, Tag, Push And Pull From A Registry | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m04l02) | [labs/m04l02/](labs/m04l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-4-2) |
| 18 | Minimal Bases, Non Root Users And Smaller Images | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m04l03) | [labs/m04l03/](labs/m04l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-4-3) |
| 19 | Scan, Patch And Inspect The Software Supply Chain | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m04l04) | [labs/m04l04/](labs/m04l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-4-4) |
| | **Data, Networks And Runtime Configuration** | | | |
| 20 | Ephemeral Filesystems And Named Volumes | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m05l01) | [labs/m05l01/](labs/m05l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-5-1) |
| 21 | Bind Mounts, Permissions And Backups | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m05l02) | [labs/m05l02/](labs/m05l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-5-2) |
| 22 | Bridge Networks, DNS And Container Communication | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m05l03) | [labs/m05l03/](labs/m05l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-5-3) |
| 23 | Port Publishing, Localhost And Network Troubleshooting | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m05l04) | [labs/m05l04/](labs/m05l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-5-4) |
| 24 | Environment, Secret Files And Runtime Restrictions | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m05l05) | [labs/m05l05/](labs/m05l05/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-5-5) |
| | **Compose And Local Development** | | | |
| 25 | Define The Service And Database With Compose | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m06l01) | [labs/m06l01/](labs/m06l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-6-1) |
| 26 | Health Checks, Dependencies And Reliable Startup | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m06l02) | [labs/m06l02/](labs/m06l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-6-2) |
| 27 | Development Overrides, Hot Reloading And Debuggers | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m06l03) | [labs/m06l03/](labs/m06l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-6-3) |
| 28 | Integration Tests, Test Data And Compose Cleanup | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m06l04) | [labs/m06l04/](labs/m06l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-6-4) |
| | **Operate The Service And Hand Off** | | | |
| 29 | Diagnose Crashes, Resource Limits And Unhealthy Containers | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m07l01) | [labs/m07l01/](labs/m07l01/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-7-1) |
| 30 | Build, Test And Promote The Same Image In CI | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m07l02) | [labs/m07l02/](labs/m07l02/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-7-2) |
| 31 | Harden And Deliver The Complete Service Stack | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m07l03) | [labs/m07l03/](labs/m07l03/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-7-3) |
| 32 | From Local Containers To Kubernetes | [▶](https://learnsome.tech/courses/docker-course/watch?lesson=m07l04) | [labs/m07l04/](labs/m07l04/) | [§](https://learnsome.tech/courses/docker-course/book#lesson-7-4) |

## Exercises

Each lesson folder contains an `EXERCISES.md` with hands-on tasks drawn directly from the course material.
Open the file for a lesson to see the tasks and, where provided, hints.

---

© LearnSome.tech · support@iwantto.learnsome.tech
