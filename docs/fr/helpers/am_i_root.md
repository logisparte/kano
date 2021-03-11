# am_i_root

> Read in [English](/docs/en/helpers/am_i_root.md)

## Description

Vérifier si l'utilisateur courant est l'utilisateur racine

## Usage

```text
am_i_root
```

## Examples

Avec le contexte :

```shell
kano assembler_hoplites
```

La tâche suivante échouera :

```shell
# tasks/assembler_hoplites

if am_i_root; then
  # <L'exécution ne passera jamais ici>
else
  fail "Seul un basileus peut assembler l'armée hoplite"
fi
```

Avec le contexte :

```shell
sudo kano assembler_hoplites
```

La tâche suivante réussira :

```shell
# tasks/assembler_hoplites

if am_i_root; then
  succeed "Je suis un basileus, assemblez les hoplites!"
else
  # <L'exécution ne passera jamais ici>
fi
```
