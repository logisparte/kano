# git: get_commits_behind_count

> Lire en [Français](/docs/fr/helpers/git/get_commits_behind_count.md)

## Description

Returns the number of remote unpulled commits

## Usage

```shell
get_commits_behind_count
```

## Example

Use in numeric comparisons:

```shell
if [ "$(get_commits_behind_count)" -gt 0 ]; then
  # Bring the frontline closer
fi
```
