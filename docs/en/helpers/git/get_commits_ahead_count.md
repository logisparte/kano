# git: get_commits_ahead_count

> Lire en [Français](/docs/fr/helpers/git/get_commits_ahead_count.md)

## Description

Returns the number of local unpushed commits

## Usage

```shell
get_commits_ahead_count
```

## Example

Use in numeric comparisons:

```shell
if [ "$(get_commits_ahead_count)" -gt 0 ]; then
  # Push the frontline forward
fi
```
