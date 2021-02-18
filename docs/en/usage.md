# Usage

> Lire en [Français](/docs/fr/usage.md)

## Initialization

Initialize the `.kano` directory in a project's root:

```shell
kano init
```

> Anything related to kano will be in this directory

## Tasks

Define any task required by the project's development workflow in `.kano/tasks`. Then, to run a
task:

```shell
kano TASK_NAME
```

### Define a task

A task file is a sourceable shell file. It must have the following format:

```shell
#!/bin/sh

some_task_name() {
  # The code
}

```

Its name must exactly match its function name (here `some_task_name`) and have no extension

## Scopes

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

## Environment

Whenever kano runs a task, it will source its corresponding environment file, if it exists.
There may be one environment file for each scope:

- Local scope => `.kano/environment`
- Global scope => `~/.kano_global/environment`

Export any environment variable required by the scope's tasks in it

> When running a local task, the global environment file will not be sourced and vice versa

## Builtin tasks

Some tasks are included with kano. They are related to kano itself and its general usage.

> Builtin tasks are documented [here](/docs/en/tasks)

## Helpers

Kano includes a collection of POSIX-compatible functions that simplify writing tasks. To use
them, task files must simply source their required helpers:

```shell
#!/bin/sh

. "$KANO_HELPERS/confirm"
. "$KANO_HELPERS/report"
. "$KANO_HELPERS/succeed"
# ...
```

> Helpers are documented [here](/docs/en/helpers)
