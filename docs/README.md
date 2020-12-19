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
contributors

This is one of the problems `kano` solves. It structures the development workflow in _tasks_
that can be run the same way across projects, regardless of their actual implementations. It
provides a common interface to work with across all projects without getting in the way

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

Initialize the `.kano` directory in a project's root:

```shell
kano init
```

> Anything related to kano will be in this directory

### Tasks

Define any task required by the project's development workflow in `.kano/tasks`. Then, to run a
task:

```shell
kano TASK_NAME
```

#### Define a task

A task file is a sourceable shell file. It must have the following format:

```shell
#!/bin/sh

some_task_name() {
  # The code
}

```

Its name must exactly match its function name (here `some_task_name`) and have no extension

### Scopes

Kano looks up for tasks in 3 different scopes, each represented by a specific directory:

- Local scope => `.kano` (project-specific)
- Global scope => `~/.kano_global` (user-specific)
- Builtin scope => Included in the kano installation (kano-specific)

When a task execution is requested, kano will look for its file first in local, then in global
and finally in the builtin scope until found. If a task is defined in 2 scopes, the file in the
first scope encountered will be used. To override this resolution, a flag may be provided

To force a global resolution:

```shell
kano -g some_task
kano --global some_task
```

To force a builtin resolution:

```shell
kano -b some_task
kano --builtin some_task
```

> Local tasks have priority by default

### Builtin tasks

Some tasks are included with kano. They are related to kano itself and its general usage

#### help

Use the `help` task in any directory to list all available tasks and their description. It's
also the default task if no task name is provided

To define a help description for a task, define a function in the task's file with the same name
as the task, but with the `_help` suffix:

```shell
#!/bin/sh

some_task_name_help() {
  echo "Some help description"
}

some_task_name() {
  # The code
}
```

#### init

Use the `init` task to create an empty kano directory. To create an empty local `.kano`
directory:

```shell
kano init # or kano init local
```

To create an empty global `~/.kano_global` directory:

```shell
kano init global
```

#### destroy

Use the `destroy` task to delete a kano directory. To delete a local `.kano` directory:

```shell
kano destroy # or kano destroy local
```

To delete the global `~/.kano_global` directory:

```shell
kano destroy global
```

### Environment

Whenever kano runs a task, it will source its corresponding environment file, if it exists.
There may be one environment file for each scope:

- Local scope => `.kano/environment`
- Global scope => `~/.kano_global/environment`

Export any environment variable required by the scope's tasks in it

> When running a local task, the global environment file will not be sourced and vice versa

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
