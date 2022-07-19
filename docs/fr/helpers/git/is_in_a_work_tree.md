# git: is_in_a_work_tree

> Read in [English](/docs/en/helpers/git/is_in_a_work_tree.md)

## Description

Indiquer si le répertoire courant est inclus dans un dépôt `git`

## Usage

```shell
is_in_a_work_tree
```

## Exemple

Utiliser dans une comparaison booléenne :

```shell
if ! is_in_a_work_tree; then
  # Pas actuellement dans un territoire ennemi, envoyer une embassade aux authorités locales
  # avant de poursuivre

else
  # Marchons
fi
```
