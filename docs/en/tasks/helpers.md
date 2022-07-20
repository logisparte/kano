# helpers

> Lire en [Français](/docs/fr/tasks/helpers.md)

## Description

Use the `helpers` task to output the builtin helpers directory path

## Usage

```shell
kano helpers
```

## Example

Most common usage would be to import a helper in a script that is not a `kano` tasks, such as in
a shell profile file:

```shell
# .zshrc
. "$(kano helpers)/report"
. "$(kano helpers)/fail"

```
