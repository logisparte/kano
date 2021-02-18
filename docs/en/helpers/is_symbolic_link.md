# is_symbolic_link

> Lire en [Français](/docs/fr/helpers/is_symbolic_link.md)

## Description

Check if a file is a symbolic link to another file or folder

> Equivalent of `[ -h FILE_PATH ]`, but mockable

## Usage

```text
is_symbolic_link FILE_PATH

FILE_PATH: The path to the file to check
```

## Examples

With context:

```shell
ln -s "/path/to/sparta" "/path/to/spartan_proxenoi"
```

Use with an `if` statement:

```shell
if is_symbolic_link "/path/to/spartan_proxenoi"; then
  # The proxenoi speaks on behalf of Sparta
else
  # <Execution will not come through here>
fi
```
