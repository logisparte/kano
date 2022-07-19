# git: has_upstream_remote

> Read in [English](/docs/en/helpers/git/has_upstream_remote.md)

## Description

Indiquer si la branche courante est paramétrée pour suivre une branche distante

## Usage

```shell
has_upstream_remote
```

## Exemple

Utiliser dans des comparaisons booléennes :

```shell
if has_upstream_remote; then
  # La rive est sécurisée, débuter le débarquement des troupes

else
  # Envoyer des troupes sécuriser la rive
fi
```
