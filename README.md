<p>
  <a href="https://learnsome.tech/courses/docker-course">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset=".github/assets/wordmark-inverse.svg">
      <img src=".github/assets/wordmark.svg" alt="LearnSome.tech" width="260">
    </picture>
  </a>
</p>

# Docker Architecture & Production Containers

**Container Runtimes, Linux Namespaces, cgroups & Multi-Stage Builds**

A complete Docker course as IDE-style videos, plus a written companion built from the same scripts. 7 modules, 32 lessons, five to ten minutes each. Intermediate level, about 2 hours.

This repository holds the labs of the LearnSome.tech course [Docker Architecture & Production Containers](https://learnsome.tech/courses/docker-course): each lab's starter files, a README with the goal, the steps and the expected output, and `./check`, which tests your work the way the site does.

## Start

[![Open in GitHub Codespaces](https://github.com/codespaces/badge.svg)](https://codespaces.new/learnsome-tech/docker-labs?quickstart=1)

- **Codespaces:** the badge opens this repository in a dev container with Python 3.14.7, kubeconform 0.8.0, hadolint 2.15.1, actionlint 1.7.12 and ansible-core and yamllint, as in the site's lab sandbox.
- **On your machine:**

  ```sh
  git clone https://github.com/learnsome-tech/docker-labs.git
  cd docker-labs
  ./check m01l03-02
  ```

  You need Python 3 for `./check`, and for the labs themselves Python 3.14.7, kubeconform 0.8.0, hadolint 2.15.1, actionlint 1.7.12 and ansible-core and yamllint. Other versions mostly work, but only the sandbox's versions are sure to print what the site prints. VS Code's Dev Containers extension builds the same container as Codespaces (x86-64).

## Doing a lab

1. Open the lesson on LearnSome.tech and the lab folder beside it: `labs/<lesson>/<lab>/`. The lab README has the goal, the steps and the expected output.
2. Work in the lab's `starter/` folder.
3. From the repository root, run `./check <lab>` (for example `./check m01l03-02`), or `./check <lesson>` for all labs of a lesson, or `./check --all`. `./check --list` shows every lab and how it is checked.

`./check` runs your starter the way the site's lab sandbox does: in a scratch copy that is its working directory and `HOME`, with `LANG=C.UTF-8`, `TZ=UTC`, `input.txt` on standard input, 10 seconds and 256 KiB of output per stream. It then compares the output with the site's own rules, so a pass here is a pass on the site.

| Check | What `./check` does | Labs |
| --- | --- | --- |
| Checker | Validates the file with the checker the site uses (hadolint, kubeconform, actionlint, yamllint, `ansible-playbook --syntax-check` or `terraform validate`); passes when it finds no errors. | 31 |
| Read along | Nothing to run here: the site shows the listing read-only, and the lab README says honestly what it needs (Docker, a cluster, a cloud account...). | 109 |

## What is published, and what is not

Every lab's starter is the code the lesson shows on screen, which is also what the lab editor on the site opens with. Where that code is the whole program, such as a recorded shell session or a script from the video, it is published as it is: it is the lesson content. Nothing beyond the lesson is published. There are no reference solutions and no answers to the lesson exercises, and nothing the site keeps private.

Pro lessons' labs are here as starters too. LearnSome.tech runs and grades your labs in its sandbox, hosts the videos and keeps your progress; running and grading a Pro lab on the site needs Pro.

## Modules and lessons

### Module 1: Containers From The Ground Up

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 1.1 | [Why Containers: Bare Metal, Machines And Processes](https://learnsome.tech/learn/docker-course/m01l01) | [2 labs](labs/m01l01/) | Free |
| 1.2 | [Namespaces And Cgroups: Isolation And Limits](https://learnsome.tech/learn/docker-course/m01l02) | [3 labs](labs/m01l02/) | Free |
| 1.3 | [Union Filesystems, Images And Writable Layers](https://learnsome.tech/learn/docker-course/m01l03) | [3 labs](labs/m01l03/) | Free |
| 1.4 | [Docker, OCI, The Engine And The CLI](https://learnsome.tech/learn/docker-course/m01l04) | [2 labs](labs/m01l04/) | Free |
| 1.5 | [Install Docker And Verify Your Environment](https://learnsome.tech/learn/docker-course/m01l05) | [3 labs](labs/m01l05/) | Free |

### Module 2: Images And The Container Lifecycle

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 2.1 | [Pull And Inspect A Third Party Image](https://learnsome.tech/learn/docker-course/m02l01) | [2 labs](labs/m02l01/) | Pro |
| 2.2 | [Run, Stop, Restart And Remove A Container](https://learnsome.tech/learn/docker-course/m02l02) | [3 labs](labs/m02l02/) | Pro |
| 2.3 | [Commands, Logs, Exec And Exit Codes](https://learnsome.tech/learn/docker-course/m02l03) | [3 labs](labs/m02l03/) | Pro |
| 2.4 | [Run The Spine Service And Publish Its Port](https://learnsome.tech/learn/docker-course/m02l04) | [3 labs](labs/m02l04/) | Pro |

### Module 3: Build Images Instruction By Instruction

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 3.1 | [Build Context, Dockerignore And Your First Dockerfile](https://learnsome.tech/learn/docker-course/m03l01) | [5 labs](labs/m03l01/) | Pro |
| 3.2 | [FROM, WORKDIR, COPY And ADD](https://learnsome.tech/learn/docker-course/m03l02) | [5 labs](labs/m03l02/) | Pro |
| 3.3 | [RUN, SHELL And Efficient Layer Caching](https://learnsome.tech/learn/docker-course/m03l03) | [6 labs](labs/m03l03/) | Pro |
| 3.4 | [ARG, ENV, LABEL, EXPOSE And VOLUME](https://learnsome.tech/learn/docker-course/m03l04) | [5 labs](labs/m03l04/) | Pro |
| 3.5 | [CMD, ENTRYPOINT, USER And Process Signals](https://learnsome.tech/learn/docker-course/m03l05) | [7 labs](labs/m03l05/) | Pro |
| 3.6 | [Multi Stage Builds, Targets And Build Secrets](https://learnsome.tech/learn/docker-course/m03l06) | [6 labs](labs/m03l06/) | Pro |

### Module 4: Registries, Image Size And Security

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 4.1 | [Tags, Digests And Reproducible Image References](https://learnsome.tech/learn/docker-course/m04l01) | [4 labs](labs/m04l01/) | Pro |
| 4.2 | [Authenticate, Tag, Push And Pull From A Registry](https://learnsome.tech/learn/docker-course/m04l02) | [5 labs](labs/m04l02/) | Pro |
| 4.3 | [Minimal Bases, Non Root Users And Smaller Images](https://learnsome.tech/learn/docker-course/m04l03) | [5 labs](labs/m04l03/) | Pro |
| 4.4 | [Scan, Patch And Inspect The Software Supply Chain](https://learnsome.tech/learn/docker-course/m04l04) | [5 labs](labs/m04l04/) | Pro |

### Module 5: Data, Networks And Runtime Configuration

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 5.1 | [Ephemeral Filesystems And Named Volumes](https://learnsome.tech/learn/docker-course/m05l01) | [4 labs](labs/m05l01/) | Pro |
| 5.2 | [Bind Mounts, Permissions And Backups](https://learnsome.tech/learn/docker-course/m05l02) | [6 labs](labs/m05l02/) | Pro |
| 5.3 | [Bridge Networks, DNS And Container Communication](https://learnsome.tech/learn/docker-course/m05l03) | [4 labs](labs/m05l03/) | Pro |
| 5.4 | [Port Publishing, Localhost And Network Troubleshooting](https://learnsome.tech/learn/docker-course/m05l04) | [3 labs](labs/m05l04/) | Pro |
| 5.5 | [Environment, Secret Files And Runtime Restrictions](https://learnsome.tech/learn/docker-course/m05l05) | [4 labs](labs/m05l05/) | Pro |

### Module 6: Compose And Local Development

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 6.1 | [Define The Service And Database With Compose](https://learnsome.tech/learn/docker-course/m06l01) | [6 labs](labs/m06l01/) | Pro |
| 6.2 | [Health Checks, Dependencies And Reliable Startup](https://learnsome.tech/learn/docker-course/m06l02) | [6 labs](labs/m06l02/) | Pro |
| 6.3 | [Development Overrides, Hot Reloading And Debuggers](https://learnsome.tech/learn/docker-course/m06l03) | [6 labs](labs/m06l03/) | Pro |
| 6.4 | [Integration Tests, Test Data And Compose Cleanup](https://learnsome.tech/learn/docker-course/m06l04) | [6 labs](labs/m06l04/) | Pro |

### Module 7: Operate The Service And Hand Off

| # | Lesson | Labs | Access |
| --- | --- | --- | --- |
| 7.1 | [Diagnose Crashes, Resource Limits And Unhealthy Containers](https://learnsome.tech/learn/docker-course/m07l01) | [4 labs](labs/m07l01/) | Pro |
| 7.2 | [Build, Test And Promote The Same Image In CI](https://learnsome.tech/learn/docker-course/m07l02) | [5 labs](labs/m07l02/) | Pro |
| 7.3 | [Harden And Deliver The Complete Service Stack](https://learnsome.tech/learn/docker-course/m07l03) | [5 labs](labs/m07l03/) | Pro |
| 7.4 | [From Local Containers To Kubernetes](https://learnsome.tech/learn/docker-course/m07l04) | [4 labs](labs/m07l04/) | Pro |

**Free** lessons are open to anyone with a free LearnSome.tech account; **Pro** lessons need a Pro membership to watch, run and grade on the site.

## Licence

- **Code** (starter files, `check` and `.learnsome/`, the dev container and the workflows) is under the [MIT licence](LICENSE).
- **Written text** (the READMEs, lab instructions, lesson text, exercises and questions) is under [CC BY-NC-SA 4.0](LICENSE-text.md): share and adapt it with attribution to LearnSome.tech, not commercially, under the same licence.
- The LearnSome.tech name and logo are not covered by either licence.

## Contributing and security

This repository is generated from the course. Report a broken lab or a content error [as an issue](../../issues/new/choose); see [CONTRIBUTING.md](CONTRIBUTING.md). Security reports go to [SECURITY.md](SECURITY.md).

© 2026 LearnSome.tech
