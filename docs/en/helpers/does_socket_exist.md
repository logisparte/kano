# does_socket_exist

> Lire en [Français](/docs/fr/helpers/does_socket_exist.md)

## Description

Check if a socket exists

> Equivalent of `[ -S SOCKET_PATH ]`, but mockable

## Usage

```text
does_socket_exist SOCKET_PATH

SOCKET_PATH: The path of the socket to check for
```

## Examples

Use with an `if` statement:

```shell
if does_socket_exist "/parlays/athenian_peace_talk.sock"; then
  # Negociate a peace with Athens
else
  # Attack Athens!
fi
```
