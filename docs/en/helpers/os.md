# os

> Lire en [Français](/docs/fr/helpers/os.md)

## Description

Determine the underlying operating system's type

## Usage

To check if the operating system is macOS:

```text
os is_macos
```

To check if the operating system is Linux:

```text
os is_linux
```

To check if the operating system is Linux Ubuntu:

```text
os is_ubuntu
```

To check if the operating system is Linux Alpine:

```text
os is_alpine
```

## Examples

Use with an `if` statement:

```shell
if os is_macos; then
  # Eat an apple

elif os is_alpine; then
  # Climb a moutain

else
  # Rest
fi
```
