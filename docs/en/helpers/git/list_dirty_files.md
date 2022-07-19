# git: list_dirty_files

> Lire en [Français](/docs/fr/helpers/git/list_dirty_files.md)

## Description

Returns a list of all changed files since last commit, excluding deleted or untracked ones

## Usage

```text
list_dirty_files
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
scytale_decrypt_all "$(list_dirty_files | xargs)"
```

Would decrypt all dirty files
