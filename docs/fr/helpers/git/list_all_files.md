# git: list_all_files

> Read in [English](/docs/en/helpers/git/list_all_files.md)

## Description

Retourne une liste de tous les fichiers suivis par `git`

## Usage

```text
list_all_files
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
list_all_files | xargs tout_decrypter_scytale
```

Décrypterait tous les fichiers suivis par `git`
