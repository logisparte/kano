# confirm

> Read in [English](/docs/en/helpers/confirm.md)

## Description

Poser une question fermée à l'utilisateur pour déterminer le flux d'exécution

## Usage

```text
confirm (OPTIONS) [QUESTION]

OPTIONS:
  -y | --yes: Résoudre automatiquement à true
  -n | --no: Résoudre automatiquement à false

QUESTION: La question fermée à poser à l'utilisateur
  défaut: "Are you sure?"
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if confirm "Envoyer 300 hommes à Thermopyles?"; then
  # En marche.
else
  # Envoyons simplement un peu de terre et d'eau...
fi
```

Ajouter l'option `-y/--yes` ou `-n/--no` pour court-circuiter automatiquement la saisie de
l'utilisateur :

```shell
if confirm --yes "Envoyer 300 hommes à Thermopyles?"; then
  # En marche.
else
  # <L'exécution ne passera jamais ici>
fi
```
