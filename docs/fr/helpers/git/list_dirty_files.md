# git: list_dirty_files

> Read in [English](/docs/en/helpers/git/list_dirty_files.md)

## Description

Retourne une liste de tous les fichiers modifiés depuis le dernier commit, excluant les fichiers
non-suivis ou effacés

## Usage

```text
list_dirty_files
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
list_dirty_files | xargs tout_decrypter_scytale
```

Décrypterait tous les fichiers modifiés
