# m06l04 · Integration Tests, Test Data And Compose Cleanup

Module 6: Compose And Local Development · lesson 6.4 · Pro · [Open the lesson](https://learnsome.tech/learn/docker-course/m06l04)

**Goal:** You can run integration tests in a container against the real stack, seed and load test data, isolate each run with its own project name, turn the result into an exit code, and clean up every container, network and volume a run created.

## Labs

| Lab | What it is | Check |
| --- | --- | --- |
| [m06l04-02](m06l04-02/) | Run the suite once | Read along |
| [m06l04-03](m06l04-03/) | Seed data and a test service | Checker |
| [m06l04-04](m06l04-04/) | The smoke test itself | Read along |
| [m06l04-05](m06l04-05/) | Shared state breaks a rerun | Read along |
| [m06l04-06](m06l04-06/) | A fresh project and one exit code | Read along |
| [m06l04-07](m06l04-07/) | Clean up every run | Read along |

## Exercises

Open exercises from the lesson, to try on your own. They have no answer files: work them out, and use the labs above as reference.

### Your turn: a pipeline script

1. Write run-tests.sh: pick a unique project name, up --exit-code-from test test, keep the code
2. Add a trap so docker compose down -v runs on every exit, even when the tests fail
3. Run it twice at the same time in two terminals and confirm both pass
4. Break the third check on purpose and confirm the script exits 1 and still cleans up

> **Hint:** A trap on signal 0 runs when the script ends, pass or fail; $$ in the project name makes it unique.

## Check yourself

- Why did the second run in project run-a fail, and why was the code not the problem?
- What keeps the database health check from passing before the seed file has loaded?
- What does --exit-code-from stop, and what is still running afterwards?
- Where in a pipeline script should docker compose down -v go, and why?

---

[Course README](../../README.md) · [Docker Architecture & Production Containers on LearnSome.tech](https://learnsome.tech/courses/docker-course)
