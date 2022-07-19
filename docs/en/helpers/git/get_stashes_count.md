# git: get_stashes_count

> Lire en [Français](/docs/fr/helpers/git/get_stashes_count.md)

## Description

Returns the number of stashes

## Usage

```shell
get_stashes_count
```

## Example

Use in numeric comparisons:

```shell
if [ "$(get_stashes_count)" -gt 0 ]; then
  # Supplies have been set aside for later. Quartermaster, make sure we don't lose any
fi
```
