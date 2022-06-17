# git: get_all_files

> Read in [English](/docs/en/helpers/git/get_all_files.md)

## Description

Retourne une liste de tous les fichiers suivis par Git

## Usage

```text
get_all_files
```

## Exemples

Avec le contexte :

```shell
tout_decrypter_scytale() {
  # décrypte tous les fichiers pourvus en utilisant une scytale
}
```

Utiliser comme liste d'arguments :

```shell
tout_decrypter_scytale "$(get_all_files | xargs)"
```

Décrypterait tous les fichiers suivis par Git
