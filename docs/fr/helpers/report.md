# report

> Read in [English](/docs/en/helpers/report.md)

## Description

Afficher un message dans le terminal, optionnellement en couleur

## Usage

```text
report [message MESSAGE [COULEUR]]
report [success MESSAGE]
report [info MESSAGE]
report [warning MESSAGE]
report [error MESSAGE]

MESSAGE: Le message à afficher

COULEUR: La couleur du message. Doit être un argument que [colorize](/docs/fr/colorize.md) peut
         reconnaître comme couleur
  défaut: "white"
```

## Exemples

Utiliser directement :

```shell
report message "Un message pour la reine" # blanc
```

```shell
report message "Un message pour la reine" "cyan" # cyan
```

```shell
report success "Le récit d'une victoire" # vert
```

```shell
report info "Ici, c'est Sparte" # cyan
```

```shell
report warning "Choisissez vos prochains mots avec prudence, Leonidas" # jaune
```

```shell
report error "Les perses ont trouvés le chemin à chèvre dans les montagnes!" # rouge
```

> Afficher un message d'erreur redirige le texte vers `STDERR` à la place de `STDOUT`

ou avec [colorize](/docs/fr/colorize.md), pour colorer un message partiellement :

```shell
# En pointant ses hommes
report message "$(colorize "Voici" bold_white) les murs de Sparte."
```
