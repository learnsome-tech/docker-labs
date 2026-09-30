# m01l05 · Install Docker And Verify Your Environment

Module 1: Containers From The Ground Up · lesson 1.5 · Free · [Open the lesson](https://learnsome.tech/learn/docker-course/m01l05)

**Goal:** You can install the right Docker for your operating system, prove the daemon is reachable from your shell, and know which post-install steps decide whether you type sudo for the rest of your career.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m01l05-02](m01l05-02/) | Installing the engine on a Debian or Ubuntu host | Read along |
| [m01l05-03](m01l05-03/) | Both halves have to answer | Read along |
| [m01l05-04](m01l05-04/) | The canonical first container | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Prove your environment

1. Run the version command and confirm you get both a client and a server section.
2. Run the hello world container, then list containers including stopped ones.
3. On Linux, check that you can run docker without sudo, and that the service is enabled at boot.
4. On Desktop, find the resource settings and note how much memory the virtual machine has.

> **Hint:** If only the client section appears, the daemon is not running or your user cannot reach its socket.

## Check yourself

- What does Docker Desktop have to carry on a Mac that Docker Engine does not need on Linux?
- You run the version command and only the client section appears. Name two possible causes.
- Why is adding a user to the docker group a privileged decision?
- What does the remove flag do, and why is it a good habit for throwaway containers?
- Why does the architecture your containers report matter when you deploy elsewhere?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
