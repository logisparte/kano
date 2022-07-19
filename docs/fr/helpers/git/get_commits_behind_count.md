# git: get_commits_behind_count

> Read in [English](/docs/en/helpers/git/get_commits_behind_count.md)

## Description

Retourner le nombre de commits distants non-tirés

## Usage

```shell
get_commits_behind_count
```

## Exemple

Utiliser dans les comparaisons numériques :

```shell
if [ "$(get_commits_behind_count)" -gt 0 ]; then
  # Ramener la ligne de front plus près
fi
```
