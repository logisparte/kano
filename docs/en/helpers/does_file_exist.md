# does_file_exist

> Lire en [Français](/docs/fr/helpers/does_file_exist.md)

## Description

Check if a file exists

> Equivalent of `[ -f FILE_PATH ]`, but mockable

## Usage

```text
does_file_exist FILE_PATH

FILE_PATH: The path of the file to check for
```

## Examples

Use with an `if` statement:

```shell
if does_file_exist "/treaties/peace_treaty_with_athens.txt"; then
  # Don't attack Athens.
else
  # Attack Athens!
fi
```
