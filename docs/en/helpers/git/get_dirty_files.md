# git: get_dirty_files

> Lire en [Français](/docs/fr/helpers/git/get_dirty_files.md)

## Description

Returns a list of all changed files since last commit, excluding deleted or untracked ones

## Usage

```text
get_dirty_files
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
scytale_decrypt_all "$(get_dirty_files | xargs)"
```

Would decrypt all dirty files
