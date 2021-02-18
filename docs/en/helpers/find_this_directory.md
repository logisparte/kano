# find_this_directory

> Lire en [Français](/docs/fr/helpers/find_this_directory.md)

## Description

Find the absolute path to the directory containing the current shell executable file

## Usage

```text
find_this_directory
```

## Examples

Use with a variable assignment:

```shell
# /tactics/combat/form_phalanx

CURRENT_DIRECTORY="$(find_this_directory)"
```

To have `$CURRENT_DIRECTORY` equal to `/tactics/combat`

> Also works if the executable is executed through a symbolic link
