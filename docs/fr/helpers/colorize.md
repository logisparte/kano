# colorize

> Read in [English](/docs/en/helpers/colorize.md)

## Description

Colorer du texte qui sera affiché dans le terminal

## Usage

```text
colorize TEXTE [COULEUR]

TEXTE: Le texte à colorer
COULEUR: La couleur à utiliser
  défaut: "white"
```

## Exemples

Utiliser avec `printf` :

```shell
printf "Brasidas était un %s héros spartiate" "$(colorize "vrai" bold_white)"
```

ou [report](/docs/fr/report.md) :

```shell
report message "Brasidas était un $(colorize "vrai" bold_white) héros spartiate"
```

> Les couleurs disponibles sont : `white`, `bold_white`, `gray`, `black`, `red`, `yellow`,
> `green` `cyan`, `blue` et `purple`. Un nombre entre 0 et 255 qui correspondant à un
> [code de couleur de 8 bits](https://jonasjacek.github.io/colors/) peut être passé à la place
