# init

> Lire en [Français](/docs/fr/tasks/init.md)

## Description

Use the `init` task to create tasks and kano directories

## Usage

```text
kano init SCOPE TEMPLATE [TEMPLATE_DETAILS]

SCOPE: project | user | system
TEMPLATE: directory | task
TEMPLATE_DETAILS: task name for task template
```

> Some shortcuts are detailed below

## Examples

To initialize an empty project directory (`$PWD.kano`), use one of:

```shell
kano init project directory
kano init project
kano init
```

To initialize an empty user directory (`$HOME/.kano_user`), use one of:

```shell
kano init user directory
kano init user
```

To initialize an empty system directory (`/etc/kano`), use one of:

```shell
sudo kano init system directory
sudo kano init system
```

> Initializing system tasks and directories requires root privilege

To create a project task named `train`, use one of:

```shell
kano init project task train
kano init task train
```

To create a user task named `train`:

```shell
kano init user task train
```
