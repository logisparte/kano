# does_symbol_exist

> Lire en [Français](/docs/fr/helpers/does_symbol_exist.md)

## Description

Check if symbol (function, program, etc.) exists in current context

## Usage

```text
does_symbol_exist SYMBOL

SYMBOL: The symbol to check for
```

## Examples

With context:

```shell
form_phalanx() {
  # Each man should protect the man to his left with his aspis
}
```

Use with an `if` statement:

```shell
if does_symbol_exist "form_phalanx"; then
  # Let's fight!
else
  # <The execution will not come through here>
fi

if does_symbol_exist "form_fleet"; then
  # <The execution will not come through here>
else
  # We'll need to ask the corinthians
fi
```
