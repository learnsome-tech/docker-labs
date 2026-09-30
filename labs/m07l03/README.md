# m07l03 · Harden And Deliver The Complete Service Stack

Module 7: Operate The Service And Hand Off · lesson 7.3 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m07l03)

**Goal:** You can deliver the service and its database as one Compose stack that runs as a non root user on a read only filesystem, with no capabilities, no privilege escalation, resource limits, health checks, a restart policy, a graceful stop and a secret file, and prove every one of those controls from a shell.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m07l03-02](m07l03-02/) | Audit the image as it runs by default | Read along |
| [m07l03-03](m07l03-03/) | The hardened service | Checker |
| [m07l03-04](m07l03-04/) | The database, its secret and its volumes | Checker |
| [m07l03-05](m07l03-05/) | Prove the user, the filesystem and the limits | Read along |
| [m07l03-06](m07l03-06/) | Prove the secret, the restart policy and the stop | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Break it on purpose, then fix it

1. Remove the tmpfs line, start the stack and find out what, if anything, stops working.
2. Lower the api memory limit until the service is killed; note the value and the evidence.
3. Drop every capability from db with cap_drop, read its logs, then add back only what it needs.
4. Kill the api process from inside and confirm the restart policy brings it back.

> **Hint:** The last probe output and OOMKilled from lesson one are still the fastest evidence.

## Check yourself

- What does each control in the api service remove from an attacker or a bug?
- How would you prove, from a shell, that a container has no capabilities?
- Why must the secrets directory be listed in the docker ignore file?
- What happens to the database volume with and without the volumes flag on down?
- How would you pick a memory limit for a service you have never measured?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
