# get_absolute_directory_path

> Lire en [Français](/docs/fr/helpers/get_absolute_directory_path.md)

## Description

Find the absolute path to the directory containing the file located at the provided relative
path

## Usage

```text
get_absolute_directory_path RELATIVE_FILE_PATH

RELATIVE_FILE_PATH: The relative path to the file
```

## Examples

With context:

```shell
# /tactics/combat/form_phalanx

# ...
```

Use with a variable assignment:

```shell
# /tactics/stealth/prepare_ambush

FORM_PHALANX_DIRECTORY_ABSOLUTE_PATH="$(get_absolute_directory_path "../combat/form_phalanx")"
```

To have `$FORM_PHALANX_DIRECTORY_ABSOLUTE_PATH` equal to `/tactics/combat`
