# press_enter_to_continue

> Read in [English](/docs/en/helpers/press_enter_to_continue.md)

## Description

Pauser l'exécution jusqu'à ce que l'utilisateur appuie sur `ENTRÉE`

## Usage

```text
press_enter_to_continue [MESSAGE]

MESSAGE: Le message à afficher
  défaut: "Press ENTER to continue"
```

## Exemples

Utiliser directement :

```shell
while bataille_hoplite_est_en_cours; do
  press_enter_to_continue # pause jusqu'à ENTRÉE
  report message "Poussez!"
  pousser
done
```

ou avec un message personnalisé :

```shell
former_phalange
press_enter_to_continue "Appuyez sur ENTRÉE pour lancer l'attaque" # pause jusqu'à ENTRÉE
lancer_attaque
```
