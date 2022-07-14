# dockered

> Lire en [Français](/docs/fr/tasks/dockered.md)

## Description

Use the `dockered` task to execute a task inside a development container

> See the [docker](/docs/en/tasks/docker.md) task documentation for more information

## Usage

To execute a task inside a development container :

```shell
kano dockered TASK
```

If already in a development container, the task will execute normally. Otherwise it will
delegate to:

```shell
kano docker execute kano TASK
```
