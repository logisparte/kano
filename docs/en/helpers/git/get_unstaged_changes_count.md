# git: get_unstaged_changes_count

> Lire en [Français](/docs/fr/helpers/git/get_unstaged_changes_count.md)

## Description

Returns the number of local changes not staged for commit, excluding untracked files

## Usage

```shell
get_unstaged_changes_count
```

## Example

Use in numeric comparisons:

```shell
if [ "$(get_unstaged_changes_count)" -eq 0 ]; then
  # All troops have mustered, let's march
fi
```
