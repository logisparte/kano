# report

> Lire en [Français](/docs/fr/helpers/report.md)

## Description

Display a message in the terminal, optionally in color

## Usage

```text
report [message MESSAGE [COLOR]]
report [success MESSAGE]
report [info MESSAGE]
report [warning MESSAGE]
report [error MESSAGE]

MESSAGE: The message to display

COLOR: The message color. Must be an argument that [colorize](/docs/en/colorize.md) can
       recognize as a color
  default: "white"
```

## Examples

Use directly:

```shell
report message "A message for the queen" # white
```

```shell
report message "A message for the queen" "cyan" # cyan
```

```shell
report success "A tale of victory" # green
```

```shell
report info "This is Sparta" # cyan
```

```shell
report warning "Choose your next words carefully Leonidas" # yellow
```

```shell
report error "The persians have found the goat path in the mountains!" # red
```

> Reporting an error outputs the message to `STDERR` instead of `STDOUT`

or with [colorize](/docs/en/colorize.md), to partially colorize a message:

```shell
# Pointing to his men
report message "$(colorize "These" bold_white) are Sparta's walls."
```
