# m07l02-04 · Promote by moving tags, not by rebuilding

**Lesson:** [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) (lesson 7.2, module 7: Operate The Service And Hand Off) · Pro  
**Check:** Read along

## Goal

You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

In the lesson: Promotion is a change of labels in the registry, not a build. The buildx image tools create command writes a new tag that points at an existing manifest, entirely on the registry side, so the promoting job never pulls or rebuilds anything. Keep it in a short variable, then point staging at the commit's image, and later, once staging has been checked, point production at whatever staging holds. Inspect the commit tag and the production tag: the digest lines are identical, character for character. Ask the registry for its tag list and you see three names for one image. Rolling back is the same move in reverse, pointing production at an older commit tag. Nothing here needed the source code or a builder, which is what makes promotion fast, auditable and safe to automate.

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
   reg=localhost:18702/taskapi
   retag="docker buildx imagetools create --progress none"
   $retag -t $reg:staging $reg:4d7c1e9
   $retag -t $reg:prod $reg:staging
   docker buildx imagetools inspect $reg:4d7c1e9 | sed -n 3p
   docker buildx imagetools inspect $reg:prod | sed -n 3p
   curl -s localhost:18702/v2/taskapi/tags/list
   docker rm -f m07l02-reg
   ```

## How to check

**Read along.** It needs Docker (or another container engine), which the lab sandbox does not have. Run it on a machine with Docker installed.

There is nothing to check: `./check m07l02-04` says so and moves on.

---

[Open the lesson on LearnSome.tech](https://learnsome.tech/learn/docker-course/m07l02) · [All labs of this lesson](../README.md) · [Course README](../../../README.md)
