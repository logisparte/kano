# get_absolute_directory_path

> Read in [English](/docs/en/helpers/get_absolute_directory_path.md)

## Description

Trouver le chemin absolu vers le répertoire contenant le fichier se trouvant au chemin relatif
donné

## Usage

```text
get_absolute_directory_path CHEMIN_RELATIF_DU_FICHIER

CHEMIN_RELATIF_DU_FICHIER: Le chemin relatif vers le fichier
```

## Exemples

Avec le contexte :

```shell
# /tactiques/combat/former_phalange

# ...
```

Utiliser avec une assignation de variable :

```shell
# /tactiques/furtivite/preparer_ambuscade

CHEMIN_ABSOLU_VERS_REPERTOIRE_DE_FORMER_PHALANGE="$(get_absolute_directory_path "../combat/former_phalange")"
```

Pour faire en sorte que `$CHEMIN_ABSOLU_VERS_REPERTOIRE_DE_FORMER_PHALANGE` soit égal à
`/tactiques/combat`
