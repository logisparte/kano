# colorize

> Lire en [Français](/docs/fr/helpers/colorize.md)

## Description

Colorize text that will be displayed in the terminal

## Usage

```text
colorize TEXT [COLOR]

TEXT: The text to colorize
COLOR: The color to colorize the text with
  default: "white"
```

## Examples

Use with `printf`:

```shell
printf "Brasidas was a %s spartan hero" "$(colorize "true" bold_white)"
```

or [report](/docs/en/report.md):

```shell
report message "Brasidas was a $(colorize "true" bold_white) spartan hero"
```

> Available colors are: `white`, `bold_white`, `gray`, `black`, `red`, `yellow`, `green` `cyan`,
> `blue` and `purple`. A number between 0 and 255 matching an
> [8-bit color code](https://jonasjacek.github.io/colors/) can be passed instead
