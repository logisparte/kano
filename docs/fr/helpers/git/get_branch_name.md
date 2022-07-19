# git: get_branch_name

> Read in [English](/docs/en/helpers/git/get_branch_name.md)

## Description

Retourner le nom de la branche courante

## Usage

```shell
get_branch_name
```

## Exemple

Utiliser dans les comparaisons de chaine de caractères :

```shell
if [ "$(get_branch_name)" = "platea" ]; then
  # Anéantir ces perses
fi
```
