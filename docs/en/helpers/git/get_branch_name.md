# git: get_branch_name

> Lire en [Français](/docs/fr/helpers/git/get_branch_name.md)

## Description

Returns the name of the current branch

## Usage

```shell
get_branch_name
```

## Example

Use in string comparisons:

```shell
if [ "$(get_branch_name)" = "platea" ]; then
  # Crush these persians
fi
```
