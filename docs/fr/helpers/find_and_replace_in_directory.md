# find_and_replace_in_directory

> Read in [English](/docs/en/helpers/find_and_replace_in_directory.md)

## Description

Trouver et remplacer toutes les occurences d'une string dans tous les fichiers d'un répertoire
et ses sous-répertoires

## Usage

```text
find_and_replace_in_directory REPERTOIRE STRING_ORIGINALE STRING_DE_REMPLACEMENT

REPERTOIRE: Le répertoire dans lequel chercher
STRING_ORIGINALE: La string à trouver dans chaque fichier
STRING_DE_REMPLACEMENT: La string avec laquelle remplacer STRING_ORIGINALE
```

## Exemples

Avec le contexte :

```shell
# /diplomatie/lister_toutes_les_relations

echo "Thémistocle est un allié"
```

```shell
# /diplomatie/athenes/lister_les_relations_atheniennes

echo "Thémistocle est un allié"
```

Utiliser directement :

```shell
find_and_replace_in_directory "/diplomatie" "Thémistocle est un allié" "Thémistocle est un ennemi"
```

Pour avoir le résulat :

```shell
# /diplomatie/lister_toutes_les_relations

echo "Thémistocle est un ennemi"
```

```shell
# /diplomatie/athenes/lister_les_relations_atheniennes

echo "Thémistocle est un ennemi"
```
