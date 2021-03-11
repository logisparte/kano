# init

> Read in [English](/docs/en/tasks/init.md)

## Description

Utiliser la tâche `init` pour créer des tâches et des répertoires kano

## Usage

```text
kano init NIVEAU GABARIT [DETAILS_GABARIT]

NIVEAU: project | user | system
GABARIT: directory | task
DETAILS_GABARIT: nom de tâche (task)
```

> Quelques raccourcis sont détaillés ci-bas

## Exemples

Pour créer un répertoire projet `.kano` vide, utiliser une commandes suivantes :

```shell
kano init project directory
kano init project
kano init
```

Pour créer un répertoire user `~/.kano_user` vide, utiliser une commandes suivantes :

```shell
kano init user directory
kano init user
```

Pour créer une tâche projet nommée `entrainer`, utiliser une commandes suivantes :

```shell
kano init project task entrainer
kano init task entrainer
```

Pour créer une tâche utilisateur nommée `entrainer` :

```shell
kano init user task entrainer
```
