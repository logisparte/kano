# does_directory_exist

> Lire en [Français](/docs/fr/helpers/does_directory_exist.md)

## Description

Check if a directory exists

> Equivalent of `[ -d DIRECTORY_PATH ]`, but mockable

## Usage

```text
does_directory_exist DIRECTORY_PATH

DIRECTORY_PATH: The path of the directory to check for
```

## Examples

Use with an `if` statement:

```shell
if does_directory_exist "/peloponnesian_league_city_states/"; then
  # Good, we're going to need it
else
  # Create /peloponnesian_league_city_states/
fi
```
