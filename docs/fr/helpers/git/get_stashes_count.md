# git: get_stashes_count

> Read in [English](/docs/en/helpers/git/get_stashes_count.md)

## Description

Retourner le nombre de remisages

## Usage

```shell
get_stashes_count
```

## Exemple

Utiliser dans les comparaisons numériques :

```shell
if [ "$(get_stashes_count)" -gt 0 ]; then
  # Des vivres ont été mises de côté pour plus tard.
  # Quartier-maitre, veillez à ce qu'on n'en perde pas
fi
```
