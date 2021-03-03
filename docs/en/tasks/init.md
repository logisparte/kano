# init

> Lire en [Français](/docs/fr/tasks/init.md)

## Description

Use the `init` task to create tasks and kano directories

## Usage

```text
kano init SCOPE TEMPLATE [TEMPLATE_DETAILS]

SCOPE: local | global
TEMPLATE: directory | task
TEMPLATE_DETAILS: task's name (task)
```

> Some shortcuts are detailed below

## Examples

To create an empty local `.kano` directory, use one of:

```shell
kano init local directory
kano init local
kano init
```

To create an empty global `~/.kano_global` directory, use one of:

```shell
kano init global directory
kano init global
```

To create a local task named `train`, use one of:

```shell
kano init local task train
kano init task train
```

To create a global task named `train`:

```shell
kano init global task train
```
