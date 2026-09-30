# m04l02 · Authenticate, Tag, Push And Pull From A Registry

Module 4: Registries, Image Size And Security · lesson 4.2 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m04l02)

**Goal:** You can run a private registry, push the service to it, pull it back by tag and by digest, and log in without leaving a reusable password lying around.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m04l02-02](m04l02-02/) | Run a registry and push to it | Read along |
| [m04l02-03](m04l02-03/) | Pull it back by tag and by digest | Read along |
| [m04l02-05](m04l02-05/) | Lock the registry | Read along |
| [m04l02-06](m04l02-06/) | Log in, push, and find where the secret went | Read along |
| [m04l02-07](m04l02-07/) | Signing in to Docker Hub from a terminal | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Round trip through your own registry

1. Run registry:3 on port 18402, push the service as 1.0.0 and 1.0, and list the tags over HTTP.
2. Delete every local copy, then pull by digest and run the version check.
3. Restart the registry with the lesson's password file and show an anonymous push is refused.
4. Log in with --password-stdin, push again, inspect your client config, then log out.

> **Hint:** Point the client configuration variable at a temporary directory first so your real login is safe.

## Check yourself

- Why must a tag include the registry host before you can push to a private registry?
- What does the digest printed at the end of a push let a server do that the tag cannot?
- Where does the login command store a secret on Docker Desktop, and where on a Linux server with no helper?
- Why is reading a token from standard input safer than passing it as an argument?
- What happens to the images in this lesson's registry when its container is removed, and why?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
