# m07l04 · From Local Containers To Kubernetes

Module 7: Operate The Service And Hand Off · lesson 7.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m07l04)

**Goal:** You can show that the service image is a standard OCI artifact that any conforming runtime can run, explain why removing dockershim from Kubernetes did not affect images, and translate each part of the Compose stack into the Kubernetes object that takes over its job.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m07l04-02](m07l04-02/) | The image is a standard, not a Docker format | Read along |
| [m07l04-04](m07l04-04/) | From Compose keys to Kubernetes objects | Read along |
| [m07l04-05](m07l04-05/) | The service as a Deployment | Checker |
| [m07l04-06](m07l04-06/) | A stable name and the configuration | Checker |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Prepare your own hand-off

1. Save the service image with docker save and read index.json to find its manifest digest.
2. Write a one page runtime contract: port, user, signal, health path, env, secrets, limits.
3. Translate the hardened compose.yaml from lesson three into manifests, control by control.
4. Mark every Compose key that has no Kubernetes equivalent and say what replaces it.

> **Hint:** Container-level securityContext holds readOnlyRootFilesystem and capabilities.

## Check yourself

- What four things make up a complete hand-off of a containerised service?
- Why did removing dockershim not break any images?
- Which Kubernetes objects replace a Compose service, its ports, its environment and its secrets?
- What must you write for Kubernetes that the image's HEALTHCHECK used to cover?
- Which habits from a single Docker host stop working inside a cluster, and why?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
