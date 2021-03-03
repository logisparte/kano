# init

> Read in [English](/docs/en/tasks/init.md)

## Description

Utiliser la tâche `init` pour créer des tâches et des répertoires kano

## Usage

```text
kano init NIVEAU GABARIT [DETAILS_GABARIT]

NIVEAU: local | global
GABARIT: directory | task
DETAILS_GABARIT: nom de tâche (task)
```

> Quelques raccourcis sont détaillés ci-bas

## Exemples

Pour créer un répertoire local `.kano` vide, utiliser une commandes suivantes :

```shell
kano init local directory
kano init local
kano init
```

Pour créer un répertoire global `~/.kano_global` vide, utiliser une commandes suivantes :

```shell
kano init global directory
kano init global
```

Pour créer une tâche locale nommée `entrainer`, utiliser une commandes suivantes :

```shell
kano init local task entrainer
kano init task entrainer
```

Pour créer une tâche globale nommée `entrainer` :

```shell
kano init global task entrainer
```
