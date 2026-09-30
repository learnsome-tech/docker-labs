# m04l04-03 · Matching against advisories needs an account

**Lesson:** [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) (lesson 4.4, module 4: Registries, Image Size And Security) · Pro  
**Check:** Read along

## Goal

You can list what an image really contains, explain how a scanner turns that list into vulnerabilities, attach an SBOM and provenance to a build, and patch by rebuilding on a supported base.

In the lesson: Listing packages is local, but matching them against advisories uses Docker's service, so this step needs a Docker account. The course machine has none, so this transcript is the real answer it gave when asked for vulnerabilities, and the verifier cannot replay it. Once you log in, the same command prints each vulnerable package with its CVE identifiers, severity, and the version that fixes it, and a summary command gives counts by severity for a quick overview. Other scanners work the same way with their own databases, so pick one, run it in your pipeline on every build, and fail the build on the severities your team has agreed it will not ship. The numbers change daily as new advisories land, even for an image you never rebuild.

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
   docker scout cves m04l04-taskapi:1
   ```

## How to check

**Read along.** It is a listing to read alongside the lesson, not a program to run.

There is nothing to check: `./check m04l04-03` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m04l04) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
