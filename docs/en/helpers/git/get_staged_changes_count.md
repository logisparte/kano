# git: get_staged_changes_count

> Lire en [Français](/docs/fr/helpers/git/get_staged_changes_count.md)

## Description

Returns the number of local changes staged for commit

## Usage

```shell
get_staged_changes_count
```

## Example

Use in numeric comparisons:

```shell
if [ "$(get_staged_changes_count)" -eq 0 ]; then
  # No troops have mustered yet, we cannot march
fi
```
