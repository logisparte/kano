# kano

> Lire en [Français](/docs/README.fr.md)

Software engineering task management CLI

## About

> `κάνω` (phonetic: `káno`) is greek for "do" or "make"

Software engineering workflows are all composed of basic actions that engineers make multiple
times per day, such as running tests, formatting code, etc. The implementation of these actions
will vary depending on the language, the tools the team uses and other such concerns. Most of
the time, this is handled through one-liner scripts in the language's package manager
configuration. When things get more complex, these one-liners rapidly evolve into big untestable
scripts with varying folder structures and poor documentation. It drives up the maintenance
costs as well as the cognitive costs of switching between projects and onboarding new
contributors.

This is one of the problems `kano` solves. It structures your development workflow in _tasks_
that can be run the same way across projects, regardless of their actual implementations. It
gives you a common interface to work with all your projects without getting in your way.

## License

`kano` is _free as in freedom_, under the terms of the [GPL-3.0 License](/LICENSE)

## Install

First, if not already done, track our package index:

```shell
brew tap logisparte/packages
```

Then install the package:

```shell
brew install kano
```

## Use

### Initialization

Initialize the `.kano` directory at your project's root:

```shell
kano init
```

> Anything related to kano will be in this directory

### Tasks

Define any task your development workflow requires in `.kano/tasks`. Then, to run a task:

```shell
kano TASK_NAME
```

#### Define a task

A task file is a sourceable shell file. It must have the following format:

```shell
#!/bin/sh

some_task_name() {
  # Your code
}

```

Its name must exactly match its function name (here `some_task_name`) and have no extension

#### Environment

Whenever kano runs a task, it will source `.kano/environment`, if it exists. Export any
environment variable required by your tasks in it

## Develop

### Prerequisites

The [Homebrew](https://github.com/Homebrew/brew) package manager is required. To install the
required dependencies:

```shell
brew bundle install
```

### Setup

Git hooks are used to ensure commit integrity. To install the git hooks:

```shell
kano setup
```

> This should be done right after cloning the repository

### Teardown

To undo whatever `setup` did:

```shell
kano teardown
```

### Test

[ShellSpec](https://github.com/shellspec/shellspec) is used to test the source code. To run all
tests:

```shell
kano test
```

### Format

[shfmt](https://github.com/mvdan/sh) is used to format shell files.
[Prettier](https://github.com/prettier/prettier) is used to format markdown and yaml files. To
format all files:

```shell
kano format
```

> The `pre-commit` git hook ensures commited code is formatted

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) is used to lint shell code.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) is used to lint markdown code.
To lint all code:

```shell
kano lint
```

> The `pre-commit` git hook prevents committing code with lint errors

### Build

To build the project:

```shell
kano build
```

> The `/build` directory will contain the artifact
