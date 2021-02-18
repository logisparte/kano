# does_symbol_exist

> Read in [English](/docs/en/helpers/does_symbol_exist.md)

## Description

Vérifier si un symbole (fonction, programme, etc.) existe dans le contexte courant

## Usage

```text
does_symbol_exist SYMBOLE

SYMBOLE: Le symbole à vérifier
```

## Exemples

Avec le contexte:

```shell
former_phalange() {
  # Chaque homme devrait protéger l'homme à sa gauche avec son aspis
}
```

Utiliser avec une instruction `if` :

```shell
if does_symbol_exist "former_phalange"; then
  # Au combat!
else
  # <L'exécution ne passera pas ici>
fi

if does_symbol_exist "former_flotte"; then
  # <L'exécution ne passera pas ici>
else
  # Nous devrons demander aux corinthiens
fi
```
