# os

> Read in [English](/docs/en/helpers/os.md)

## Description

Déterminer le type de système d'exploitation sous-jacent

## Usage

Pour vérifier si le système d'exploitation est macOS :

```text
os is_macos
```

Pour vérifier si le système d'exploitation est Linux :

```text
os is_linux
```

Pour vérifier si le système d'exploitation est Linux Ubuntu :

```text
os is_ubuntu
```

Pour vérifier si le système d'exploitation est Linux Alpine :

```text
os is_alpine
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if os is_macos; then
  # Manger une pomme

elif os is_alpine; then
  # Monter un montagne

else
  # Se reposer
fi
```
