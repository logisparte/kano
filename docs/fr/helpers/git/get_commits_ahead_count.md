# git: get_commits_ahead_count

> Read in [English](/docs/en/helpers/git/get_commits_ahead_count.md)

## Description

Retourner le nombre de commits locaux non-poussés

## Usage

```shell
get_commits_ahead_count
```

## Exemple

Utiliser dans les comparaisons numériques :

```shell
if [ "$(get_commits_ahead_count)" -gt 0 ]; then
  # Poussez la ligne de front plus loin
fi
```
