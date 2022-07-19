# cpu

> Lire en [Français](/docs/fr/helpers/cpu.md)

## Description

Determine the underlying processor architecture

## Usage

To check if the processor architecture is ARM64:

```text
cpu is_arm64
```

To check if the operating system is AMD64 (or x86_64):

```text
cpu is_amd64
```

## Examples

Use with an `if` statement:

```shell
if cpu is_arm64; then
  # Fight with brothers in arms

else
  # Die alone
fi
```
