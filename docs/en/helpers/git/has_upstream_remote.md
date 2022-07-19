# git: has_upstream_remote

> Lire en [Français](/docs/fr/helpers/git/has_upstream_remote.md)

## Description

Returns wether the current branch has an upstream remote branch

## Usage

```shell
has_upstream_remote
```

## Example

Use in boolean comparisons:

```shell
if has_upstream_remote; then
  # Beachhead is secure, disembark the troops

else
  # Send men to secure the beach
fi
```
