# helpers

> Read in [English](/docs/en/tasks/helpers.md)

## Description

Utiliser la tâche `helpers` pour écrire le chemin vers le répertoire des _helpers_ intégrés

## Usage

```shell
kano helpers
```

## Exemple

Le cas d'usage le plus commun serait d'importer un _helper_ dans un script qui n'est pas une
tâche `kano`, tel qu'un fichier de profile d'interface système :

```shell
# .zshrc
. "$(kano helpers)/report"
. "$(kano helpers)/fail"

```
