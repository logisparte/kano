# Usage

> Lire en [Français](/docs/fr/usage.md)

## Initialization

Initialize the `.kano` directory in a project root:

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

> You can use `kano init task TASK_NAME` to quickly create an empty task template

## Scopes

Kano looks up for tasks in up to 4 different scopes, each represented by a specific directory:

|  Scope  |      Directory      |   Tasks availability   | Looked up |
| :-----: | :-----------------: | :--------------------: | :-------: |
| Project |    `$PWD/.kano`     |    In project only     | If exists |
|  User   |  `$HOME/.kano_user` | Always for logged user | If exists |
| System  |     `/etc/kano`     |         Always         | If exists |
| Builtin |  Included in kano   |         Always         |  Always   |

When a task execution is requested, kano will look for its file first in project (if it exists),
then in user (if it exists), then in system (if it exists) and finally in the builtin scope
until found. If a task is defined in 2 scopes, the file in the first scope encountered will be
used. To override this resolution, a flag may be provided

To force a user resolution:

```shell
kano -u some_task
kano --user some_task
```

To force a system resolution:

```shell
kano -s some_task
kano --system some_task
```

To force a builtin resolution:

```shell
kano -b some_task
kano --builtin some_task
```

> Project tasks have priority by default

## Environment

Whenever kano runs a task, it will source its corresponding environment file, if it exists.
There may be one environment file for each scope:

- Project scope => `.kano/environment`
- User scope => `~/.kano_user/environment`
- System scope => `/etc/kano/environment`

Export any environment variable required by the scope's tasks in it

> When running a project task, the user environment file will not be sourced and vice versa

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
