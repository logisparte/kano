# does_file_exist

> Read in [English](/docs/en/helpers/does_file_exist.md)

## Description

Vérifier si un fichier existe

> Équivalent de `[ -f CHEMIN_DU_FICHIER ]`, mais mockable

## Usage

```text
does_file_exist CHEMIN_DU_FICHIER

CHEMIN_DU_FICHIER: Le chemin vers le fichier à vérifier
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if does_file_exist "/traités/traité_de_paix_avec_athènes.txt"; then
  # Ne pas attaquer Athènes.
else
  # Attaquer Athènes!
fi
```
