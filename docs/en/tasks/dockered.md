# dockered

> Lire en [Français](/docs/fr/tasks/dockered.md)

## Description

Use the `dockered` task to execute a task inside an ephemeral development container

## Usage

To execute a task inside a development container :

```shell
kano dockered TASK
```

> `kano` must also be installed in your development image

### Note

This task uses the [docker](/docs/en/tasks/docker.md) task and is equivalent to:

```shell
kano docker run kano TASK
```
