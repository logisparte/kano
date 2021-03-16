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

An environment file is a simple shell file that exports variables that will be available in its
related tasks. There may be one environment file for each scope. Each environment file must
contain variables that are specific to their respective scopes, or that redefine higher scope
variables (see below)

Whenever kano runs a task, it sources all `environment` files available, from the highest scope
down to the task, if any exists

|  Scope  |              File               | Available environments in tasks |
| :-----: | :-----------------------------: | :-----------------------------: |
| Project |    `$PWD/.kano/environment`     |    Project, user and system     |
|  User   |  `$HOME/.kano_user/environment` |         User and system         |
| System  |     `/etc/kano/environment`     |           System only           |

For example, when a project task execution is requested, kano first sources the system
environment file (if it exists), then sources the user environment file (if it exists) and then
the project environment file (if it exists). This way, were a variable to be exported both in
project and user environment files, the project file variable value would have precedence

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
