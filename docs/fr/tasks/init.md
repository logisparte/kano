# init

> Read in [English](/docs/en/tasks/init.md)

## Description

Utiliser la tâche `init` pour créer des tâches et des répertoires kano

## Usage

```text
kano init NIVEAU GABARIT [DETAILS_GABARIT]

NIVEAU: project | user | system
GABARIT: directory | task
DETAILS_GABARIT: nom de tâche pour le gabarit task
```

> Quelques raccourcis sont détaillés ci-bas

## Exemples

Pour initialiser un répertoire projet vide (`$PWD.kano`), utiliser une des commandes suivantes :

```shell
kano init project directory
kano init project
kano init
```

Pour initialiser un répertoire utilisateur vide (`$HOME/.kano_user`), utiliser une des commandes
suivantes :

```shell
kano init user directory
kano init user
```

Pour initialiser un répertoire système vide (`/etc/kano`), utiliser une des commandes suivantes
:

```shell
sudo kano init system directory
sudo kano init system
```

> Initialiser des tâches ou des répertoires systèmes requiert des privilèges racines

Pour créer une tâche projet nommée `entrainer`, utiliser une commandes suivantes :

```shell
kano init project task entrainer
kano init task entrainer
```

Pour créer une tâche utilisateur nommée `entrainer` :

```shell
kano init user task entrainer
```
