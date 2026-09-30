# m04l04-05 · Build with attestations into a registry

**Lesson:** [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) (lesson 4.4, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

In the lesson: Attestations attach to an image index, so they need somewhere that can hold one: the containerd image store, or a registry. Start a registry on this lesson's port, keep the image name in a variable, and build with the bill of materials option, pushing straight to the registry. Provenance needs no flag, because the minimal record is on by default. Now inspect what the registry holds. The tag points at an index with two entries. The first is the image itself, for this machine's platform. The second has the platform unknown and an annotation saying it is an attestation manifest, referring to the first entry's digest. That second entry carries both records, and a scanner or a policy engine can read it without pulling the image layers.

## Files

- [`starter/.dockerignore`](starter/.dockerignore)
- [`starter/Dockerfile`](starter/Dockerfile)
- [`starter/app.py`](starter/app.py)
- [`starter/compose.yaml`](starter/compose.yaml)
- [`starter/run.sh`](starter/run.sh): the command the lesson ran
- [`starter/session.sh`](starter/session.sh): the listing from the lesson
- [`starter/setup.sh`](starter/setup.sh)
- [`check.json`](check.json): how `./check` runs and checks this lab

## Steps

1. Read `starter/session.sh` alongside the lesson.
2. On a machine that has what it needs, the lesson ran it with:

   ```sh
   bash setup.sh >/dev/null 2>&1
   docker run -d --name m04l04-registry -p 18404:5000 registry:3
   I=localhost:18404/taskapi:1
   docker buildx build -q --sbom=true -t $I --push .
   docker buildx imagetools inspect $I
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m04l04-05` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
