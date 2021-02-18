# press_enter_to_continue

> Lire en [Français](/docs/fr/helpers/press_enter_to_continue.md)

## Description

Pause execution until user presses `ENTER`

## Usage

```text
press_enter_to_continue [MESSAGE]

MESSAGE: The message to display
  default: "Press ENTER to continue"
```

## Examples

Use directly:

```shell
while is_hoplite_battle_raging_on; do
  press_enter_to_continue # pauses until ENTER
  report message "Push!"
  push
done
```

or with a custom message:

```shell
form_phalanx
press_enter_to_continue "Press ENTER to launch the attack" # pauses until ENTER
launch_attack
```
