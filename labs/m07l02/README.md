# m07l02 · Build, Test And Promote The Same Image In CI

Module 7: Operate The Service And Hand Off · lesson 7.2 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m07l02)

**Goal:** You can build one image per commit, test that exact image, push it, and promote it to staging and production by pointing tags at the same digest, both by hand against a local registry and as a CI workflow with a build cache.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m07l02-02](m07l02-02/) | Build and push one image for one commit | Read along |
| [m07l02-03](m07l02-03/) | Test the exact image you pushed | Read along |
| [m07l02-04](m07l02-04/) | Promote by moving tags, not by rebuilding | Read along |
| [m07l02-05](m07l02-05/) | The same flow as a workflow file | Checker |
| [m07l02-06](m07l02-06/) | Promotion as its own gated workflow | Checker |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Prove the promise end to end

1. Build the service twice from the same files with --no-cache and compare the two image IDs.
2. Push a commit tag, then promote it to staging and prod without building again.
3. Roll prod back to an older commit tag and show that its digest changed back.
4. Make your smoke test fail on purpose and confirm the workflow never pushes.

> **Hint:** docker buildx imagetools inspect prints the digest a tag points at, without pulling.

## Check yourself

- What goes wrong if staging and production each build the image from the same commit?
- Why is the commit hash a better tag than latest for a build?
- How would you roll production back, and what would you check afterwards?
- Why does the promote workflow need neither a checkout nor a build step?
- Where does environment specific configuration belong, if not in the image?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
