# m05l01 · Ephemeral Filesystems And Named Volumes

Module 5: Data, Networks And Runtime Configuration · lesson 5.1 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m05l01)

**Goal:** You can show that a container's writable layer is deleted with the container, keep the task API's data in a named volume that survives removal, and find, inspect and safely remove volumes.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m05l01-02](m05l01-02/) | Data that dies with its container | Read along |
| [m05l01-03](m05l01-03/) | Named volumes: storage that Docker manages | Read along |
| [m05l01-04](m05l01-04/) | The same tasks, stored on a named volume | Read along |
| [m05l01-05](m05l01-05/) | Find, inspect and remove a volume | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: keep data across an upgrade

1. Create a volume named m05l01-mine and run the task API with it mounted at /data.
2. Post two tasks, remove the container, start a new one and confirm both tasks remain.
3. Mount the volume into a throwaway alpine container and print tasks.json from it.
4. Remove every container that uses the volume, then remove the volume itself.

> **Hint:** The volume flag takes the volume name, a colon, then the path inside the container.

## Check yourself

- Where does a file written by a container go when no mount covers its path, and when is it deleted?
- Why did a fresh named volume mounted at /data arrive writable by the non-root app user?
- What is the difference between docker volume prune and docker volume prune --all?
- How do you find out which container is stopping you from removing a volume?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
