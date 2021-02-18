# list_files_in_directory

> Lire en [Français](/docs/fr/helpers/list_files_in_directory.md)

## Description

Lists files present in provided directory

> Returned files are in the `file.extension` format

## Usage

```text
list_files_in_directory DIRECTORY_PATH

DIRECTORY_PATH: The path of the directory to check in
```

## Examples

Use with a `for in` statement:

```shell
for DELIAN_LEAGUE_ALLY_FILE in $(list_files_in_directory "$DELIAN_LEAGUE_ALLIES_DIRECTORY"); do
  # Attack the delian league ally described in "$DELIAN_LEAGUE_ALLY_FILE"
done
```
