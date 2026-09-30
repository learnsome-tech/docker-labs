# m04l01 · Tags, Digests And Reproducible Image References

Module 4: Registries, Image Size And Security · lesson 4.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m04l01)

**Goal:** You can read every part of an image reference, give one build several meaningful tags, and pin an image by digest so that every machine runs exactly the same bytes.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m04l01-01](m04l01-01/) | Reading an image reference | Read along |
| [m04l01-02](m04l01-02/) | One build, three tags | Read along |
| [m04l01-03](m04l01-03/) | A tag is a pointer, and pointers move | Read along |
| [m04l01-05](m04l01-05/) | Run by digest, and see the tag ignored | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Tag, move and pin

1. Build the service and tag it with a full version, a minor version and a short commit name.
2. Point a tag of your own at alpine:3.22, then at alpine:3.20, and prove the content changed.
3. Capture the digest of alpine:3.22 and run a container by digest alone.
4. Run the tree listing and note which platforms have content on your machine.

> **Hint:** The RepoDigests field holds the repository name and the digest joined by an at sign.

## Check yourself

- What do the defaults turn the reference alpine into, part by part?
- Why does adding a second tag to an image take no extra disk space?
- A reference carries both a tag and a digest that disagree. Which one decides what runs, and why is that dangerous?
- Why should a digest pin be paired with automation that proposes updates?
- What is the difference between an image index digest and a platform manifest digest?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
