# git: get_all_files

> Lire en [Français](/docs/fr/helpers/git/get_all_files.md)

## Description

Returns a list of all files tracked by Git

## Usage

```text
get_all_files
```

## Examples

With context:

```shell
scytale_decrypt_all() {
  # decrypt all provided files using a scytale
}
```

Use as a list of argument:

```shell
scytale_decrypt_all "$(get_all_files | xargs)"
```

Would decrypt all files tracked by Git
