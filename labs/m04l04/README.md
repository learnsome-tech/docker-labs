# m04l04 · Scan, Patch And Inspect The Software Supply Chain

Module 4: Registries, Image Size And Security · lesson 4.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m04l04)

**Goal:** You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m04l04-02](m04l04-02/) | List what is inside the service image | Read along |
| [m04l04-03](m04l04-03/) | Matching against advisories needs an account | Read along |
| [m04l04-05](m04l04-05/) | Build with attestations into a registry | Read along |
| [m04l04-06](m04l04-06/) | Read the SBOM and the provenance | Read along |
| [m04l04-07](m04l04-07/) | Patch by rebuilding on a supported base | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Inventory, attest and patch

1. List the service image's packages with docker scout sbom and find the OpenSSL version.
2. Push the service with --sbom=true to registry:3 on port 18404 and count its SBOM packages.
3. Read the provenance and confirm the base digest matches your local python:3.12-alpine.
4. Rebuild the base example on alpine:3.22 and record which package versions changed.

> **Hint:** The attestation manifest shows up in the index with the platform unknown/unknown.

## Check yourself

- What does a scanner actually compare when it reports a CVE in an image?
- Why does rebuilding an image on an Alpine branch past end of support not patch it?
- Where does BuildKit store an SBOM attestation, and why can a policy engine read it without pulling layers?
- Which input in the provenance record lets you find every image built on a vulnerable base?
- What does signing add that an SBOM and provenance do not?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
