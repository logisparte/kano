# find_this_directory

> Read in [English](/docs/en/helpers/find_this_directory.md)

## Description

Trouver le chemin absolu vers le répertoire contenant le fichier shell exécutable courant

## Usage

```text
find_this_directory
```

## Exemples

Utiliser avec une assignation de variable :

```shell
# /tactiques/combat/former_phalange

CURRENT_DIRECTORY="$(find_this_directory)"
```

Pour faire en sorte que `$CURRENT_DIRECTORY` soit égal à `/tactiques/combat`

> Fonctionne aussi si l'exécutable est exécuté via un lien symbolique
