# init

> Lire en [Français](/docs/fr/tasks/init.md)

## Description

Use the `init` task to create tasks and kano directories

## Usage

```text
kano init SCOPE TEMPLATE [TEMPLATE_DETAILS]

SCOPE: project | user | team | system
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

To initialize an empty team directory (`$HOME/.kano_teams/$KANO_TEAM`), use one of:

```shell
KANO_TEAM=TEAM_NAME kano init team directory
KANO_TEAM=TEAM_NAME kano init team
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

To create a team task named `train` for team `hoplites`:

```shell
KANO_TEAM="hoplites" kano init team task train
```

> It's useful to set one's default team in one's `.zshrc` or `.bashrc`
