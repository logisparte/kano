# git: is_in_a_work_tree

> Lire en [Français](/docs/fr/helpers/git/is_in_a_work_tree.md)

## Description

Returns wether the current directory is in a `git` repository

## Usage

```shell
is_in_a_work_tree
```

## Example

Use in boolean comparisons:

```shell
if ! is_in_a_work_tree; then
  # Not in an enemy territory, send an embassy to the local authorities before proceeding

else
  # March on
fi
```
