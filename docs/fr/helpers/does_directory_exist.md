# does_directory_exist

> Read in [English](/docs/en/helpers/does_directory_exist.md)

## Description

Vérifier si un répertoire existe

> Équivalent de `[ -d CHEMIN_DU_REPERTOIRE ]`, mais mockable

## Usage

```text
does_directory_exist CHEMIN_DU_REPERTOIRE

CHEMIN_DU_REPERTOIRE: Le chemin vers le répertoire à vérifier
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if does_directory_exist "/cite_etats_de_la_ligue_du_peloponnese/"; then
  # Bonne chose, nous en aurons besoin
else
  # Créer /cite_etats_de_la_ligue_du_peloponnese/
fi
```
