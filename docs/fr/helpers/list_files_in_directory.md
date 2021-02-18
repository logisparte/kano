# list_files_in_directory

> Read in [English](/docs/en/helpers/list_files_in_directory.md)

## Description

Lister les fichiers présents dans le répertoire fourni

> Les noms des fichiers retournés sont dans le format `fichier.extension`

## Usage

```text
list_files_in_directory CHEMIN_DU_REPERTOIRE

CHEMIN_DU_REPERTOIRE: Le chemin vers le répertoire à lister
```

## Exemples

Utiliser avec une instruction `for in` :

```shell
for FICHIER_ALLIE_DE_LA_LIGUE_DE_DELOS \
in $(list_files_in_directory "$REPERTOIRE_DES_ALLIES_DE_LA_LIGUE_DE_DELOS"); do
  # Attaquer l'allié de la ligue de Délos décrit dans "$FICHIER_ALLIE_DE_LA_LIGUE_DE_DELOS"
done
```
