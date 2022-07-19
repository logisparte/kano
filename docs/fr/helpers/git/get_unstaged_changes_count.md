# git: get_unstaged_changes_count

> Read in [English](/docs/en/helpers/git/get_unstaged_changes_count.md)

## Description

Retourner le nombre de changements locaux qui ne sont pas en attente d'être commis, excluant les
fichiers non-suivis

## Usage

```shell
get_unstaged_changes_count
```

## Exemple

Utiliser dans les comparaisons numériques :

```shell
if [ "$(get_unstaged_changes_count)" -eq 0 ]; then
  # Toutes les troupes sont assemblées. Marchons
fi
```
