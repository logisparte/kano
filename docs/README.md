# kano (archived)

> Lire en [Français](/docs/README.fr.md)

Software engineering workflow automation CLI

> [!NOTE]
> This repository is no longer maintained. Users are encouraged to migrate to
> [docker-env](https://github.com/logisparte/docker-env) for containerized development
> environments and to [shell-utils](https://github.com/logisparte/shell-utils) for shell script
> helpers. Tasks should now be written as standalone scripts in `/scripts`. Task scopes are also
> abandoned.

## About

> `κάνω` (phonetic: `káno`) is greek for "do" or "make"

Software engineering workflows are composed of multiple types of activities. Some of these
activities (such as designing, coding, documenting, etc.) are creative and contribute direct
value to the project. Others (such as building, running tests, formatting code, etc.), while
still essential, do not. An efficient engineering team should strive to automate as much of this
non-value-added work as possible

`kano` is a tool that helps to do just that

### Tasks (conventionalized scripts)

Non-value-added activities can often be completely or partially automated with scripts. The
implementation of these scripts depends on the programming language, the tools and the processes
the team uses. For simple projects, inlined scripts in the language's package manager
configuration is often enough. But as projects evolve, one-liners have a tendency to become
stand-alone script files orchestrating multiple tools and utilities

Script files are extremely useful, but have the bad habit of becoming unreadable and hard to
maintain. From one project to the other, they will often differ in organization, format and
quality of documentation (if any). Worse, some might even be copy-pasted between projects,
multiplying the future efforts needed to modify them. All these little inconveniences add up and
can induce undesired cognitive load, maintenance and onboarding costs that can partly negate the
efficiency these script files might initially have gained the team

These are some of the problems `kano` aims to solve. It proposes a convention to organize,
format, document and run scripts across projects. It structures a project's scripts into _tasks_
(conventionalized scripts) and provides a simple command-line interface to execute them without
getting in the way. It also handles multiple _scopes_ of tasks to allow a team to easily share
and reuse a group of tasks or an engineer to customize his personal workflow

### Shared development environment with Docker (optional)

_Tasks_ are an important part of automating non-value-added work, but not the complete picture.
As tasks are executed in an _environment_ (CPU architecture, operating system, etc.), different
environments may produce different outcomes. This indeterminism may also negate some of the
efficiency that tasks initially have gained the team

For tasks to have deterministic outcomes, they must be executed in a deterministic environment.
This environment must be shared by all actors, including continuous integration (_CI_) and
continuous deployment (_CD_) bots. The best way to achieve this is using
[Docker](https://www.docker.com). `kano` has a builtin task that simplifies developing and
running tasks inside a Docker container. It greatly accelerates CI/CD workflows, debugging
environment-related problems and onboarding new contributors

## License

`kano` is distributed under the terms of the [Apache 2.0 license](/LICENSE)

## Users

### Installation

Installation can be done either with [Homebrew](https://github.com/Homebrew/brew) or manually
with `curl`

#### Homebrew

First, if not already done, track logisparte's package index:

```shell
brew tap logisparte/packages
```

Then install the package:

```shell
brew install kano
```

#### Manual

Download the package and run the installation script:

```shell
curl --silent --show-error --location \
  "https://github.com/logisparte/kano/releases/latest/download/kano.tar.gz" \
    | tar --extract --gzip
sudo ./kano/install
```

### Usage

See the [documentation](/docs/en/usage.md)

## Contributors

### Docker

A development Docker image is used to encapsulate project dependencies and runtime environment.
To build the image:

```shell
kano docker image build
```

> See the [Docker user guide](/docs/en/tasks/docker.md) for more information

### Format

[shfmt](https://github.com/mvdan/sh) is used to format shell files.
[Prettier](https://github.com/prettier/prettier) is used to format markdown and yaml files. To
format dirty files:

```shell
kano format
```

To format all files:

```shell
kano format all
```

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) is used to analyze shell code.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) is used to analyze markdown
code. To analyze dirty files:

```shell
kano lint
```

To analyze all files:

```shell
kano lint all
```

### Test

[ShellSpec](https://github.com/shellspec/shellspec) is used to test the source code. To run all
tests:

```shell
kano test
```

### Coverage

[Kcov](https://github.com/SimonKagstrom/kcov) is used to measure test coverage during tests. To
view the coverage report after a test run:

```shell
kano coverage
```

> NOTE: Multiline strings may report as non-covered due this
> [issue](https://github.com/SimonKagstrom/kcov/issues/145)

### Dev

To change the version of `kano` to the one under development:

```shell
kano dev on
```

> The installed version will still be available through the `_kano` symbol

To change it back to the installed version:

```shell
kano dev off
```

At any time, to know which version is currently used:

```shell
kano dev
```

### Build

To build the project:

```shell
kano build
```

> The `/build` directory will contain the artifact

### Clean

To delete all generated files (artifacts, reports, etc.):

```shell
kano clean
```

### Release

> This task should only be executed by the continuous delivery pipeline

To release a version of the project on GitHub and update logisparte's package index:

```shell
kano release VERSION GIT_NAME GIT_EMAIL GITHUB_ACCESS_TOKEN
```

> `VERSION` should be in standard semantic versioning format or a beta name (`beta-*`)
