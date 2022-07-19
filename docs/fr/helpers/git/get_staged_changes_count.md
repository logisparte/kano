# git: get_staged_changes_count

> Read in [English](/docs/en/helpers/git/get_staged_changes_count.md)

## Description

Retourner le nombre de changements locaux mis en attente pour être commis

## Usage

```shell
get_staged_changes_count
```

## Exemple

Utiliser dans les comparaisons numériques :

```shell
if [ "$(get_staged_changes_count)" -eq 0 ]; then
  # Aucune troupe d'assemblée pour l'instant, on ne peut marcher
fi
```
