# confirm

> Lire en [Français](/docs/fr/helpers/confirm.md)

## Description

Ask the user a close-ended question to determine the flow of execution

## Usage

```text
confirm (OPTIONS) [QUESTION]

OPTIONS:
  -y | --yes: Automatically resolve to true
  -n | --no: Automatically resolve to false

QUESTION: The close-ended question to ask the user
  default: "Are you sure?"
```

## Examples

Use with an `if` statement:

```shell
if confirm "Send 300 men to Thermopylae?"; then
  # March.
else
  # Let's just send some earth and water...
fi
```

Add `-y/--yes` or `-n/--no` option to automatically bypass user input:

```shell
if confirm --yes "Send 300 men to Thermopylae?"; then
  # March.
else
  # <Execution will never go through here>
fi
```
