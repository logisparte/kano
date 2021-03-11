# init

> Lire en [Français](/docs/fr/tasks/init.md)

## Description

Use the `init` task to create tasks and kano directories

## Usage

```text
kano init SCOPE TEMPLATE [TEMPLATE_DETAILS]

SCOPE: project | user | system
TEMPLATE: directory | task
TEMPLATE_DETAILS: task's name (task)
```

> Some shortcuts are detailed below

## Examples

To create an empty project `.kano` directory, use one of:

```shell
kano init project directory
kano init project
kano init
```

To create an empty user `~/.kano_user` directory, use one of:

```shell
kano init user directory
kano init user
```

To create a project task named `train`, use one of:

```shell
kano init project task train
kano init task train
```

To create a user task named `train`:

```shell
kano init user task train
```
