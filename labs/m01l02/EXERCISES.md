# Exercises — Namespaces And Cgroups: Isolation And Limits

Lesson `m01l02` · [Watch](https://learnsome.tech/courses/docker-course/watch?lesson=m01l02)

## Exercise 1: Prove the limit is real

1. Start a container with a memory limit of sixteen megabytes and read the memory maximum file.
2. Start the same image with no limit and read the same file. Write both answers down.
3. Run a container with the host process namespace and count how many processes it can see.

> **Hint**: The limit file lives under the system filesystem control group directory, and it is in bytes.


---

© LearnSome.tech · support@iwantto.learnsome.tech
