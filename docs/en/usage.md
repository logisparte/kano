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

A task file is a shell script file. It must have the following format:

```shell
#!/bin/sh

some_task_name() {
  # The code
}

```

Its name must exactly match its main function name (here `some_task_name`) and have no extension

> `kano init task TASK_NAME` can used to quickly create an empty task template

## Scopes

`kano` looks up for tasks in up to 5 different scopes, each represented by a specific directory.
From innermost to outermost, these scopes are:

| Scope   | Directory                      | Tasks availability    |
| :------ | :----------------------------- | :-------------------- |
| Project | `$PWD/.kano`                   | In project only       |
| User    | `$HOME/.kano_user`             | Always for user       |
| Team    | `$HOME/.kano_teams/$KANO_TEAM` | Always for user\*     |
| System  | `/etc/kano`                    | Always, for all users |
| Builtin | Included in `kano`             | Always, for all users |

> \* When `$KANO_TEAM` is set

When a task execution is requested, `kano` will look for its file starting in the innermost
available scope, and up to the outermost scope until it finds it. If a task is defined in
multiple scopes, the first found file will be used. To override this resolution, a flag may be
provided

To force a **user** resolution:

```shell
kano -u some_task

# or

kano --user some_task
```

To force a **team** resolution:

```shell
kano -t some_task

# or

kano --team some_task
```

> Team resolution will only work if `$KANO_TEAM` is set

To force a **system** resolution:

```shell
kano -s some_task

# or

kano --system some_task
```

To force a **builtin** resolution:

```shell
kano -b some_task

# or

kano --builtin some_task
```

There is also a special flag `-x` or `--next` that can be used inside a task to delegate to the
next available scope. This is useful when overriding a task in an outer scope to delegate
execution. See the
[docker task documentation](/docs/en/tasks/docker.md#configuring-customizations) for a concrete
example

## Environment

An environment file is a simple shell script file that exports variables that will be available
in its related tasks. There may be one environment file for each scope. Each environment file
must contain variables that are specific to their respective scopes, or that redefine outer
scope variables (see below)

Whenever `kano` runs a task, it first sources all `environment` files available in order, from
the outermost scope down to the task's. This way, if the same variable exists in two scopes, the
innermost value will be used

| Scope   | File                                      | Available environments in tasks  |
| :------ | :---------------------------------------- | :------------------------------- |
| Project | `$PWD/.kano/environment`                  | Project, user, team\* and system |
| User    | `$HOME/.kano_user/environment`            | User, team\* and system          |
| Team    | `$HOME/.kano_user/$KANO_TEAM/environment` | Team\* and system                |
| System  | `/etc/kano/environment`                   | System only                      |

> \* When `$KANO_TEAM` is set

## Builtin tasks

Some tasks are included with `kano`. They are related to `kano` itself and its general usage

> Builtin tasks are documented [here](/docs/en/tasks)

## Helpers

`kano` includes a collection of POSIX-compatible functions that simplify writing tasks. To use
them, task files must simply source their required helpers:

```shell
#!/bin/sh

. "$KANO_HELPERS/confirm"
. "$KANO_HELPERS/report"
. "$KANO_HELPERS/fail"
# ...

```

> Helpers are documented [here](/docs/en/helpers)
