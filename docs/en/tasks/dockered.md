# dockered

> Lire en [Français](/docs/fr/tasks/dockered.md)

## Description

Use the `dockered` task to execute a task inside a development container

## Usage

To execute a task inside a development container :

```shell
kano dockered TASK
```

### Note

This task uses the [docker](/docs/en/tasks/docker.md) task and is equivalent to:

```shell
kano docker execute kano TASK
```
