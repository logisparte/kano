# kano

> Read in [English](/docs/README.md)

CLI de gestion de tâches d'ingénierie logicielle

## À propos

> `κάνω` (phonétique : `káno`) signifie "faire" en grec

Les processus d'ingénierie logicielle sont tous composés d'actions de base que les ingénieurs
effectuent plusieurs fois par jour, tels qu'exécuter des tests automatisés, formatter le code,
etc. L'implémentation de ces actions varie en fonction du langage de programmation, des outils
utilisés par l'équipe et autres contraintes connexes. La plupart du temps, ces actions sont
gérées par des scripts d'une ligne dans la configuration du gestionnaire de paquet du langage
utilisé. Quand les choses deviennent plus complexes, ces scripts d'une ligne évoluent vite en
longs scripts intestables avec des structures de répertoire variables et peu (ou pas) de
documentation. Cela augmente aussi bien les coûts de maintenance que les coûts en charge
cognitive lors de changement de contexte entre projets et d'intégration de nouveaux
contributeurs.

Ceci est un des problèmes que `kano` résout. Il structure vos processus de développement en
_tâches_ qui peuvent être exécutées de la même manière à travers tous vos projets, peu importe
leur implémentation. Cela vous donne une interface commune avec laquelle travailler à travers
tous vos projets sans se mettre dans vos pattes.

## Licence

Kano est _libre comme dans liberté_, sous les termes de la [licence GPL-3.0](/LICENSE)

## Installer

Tout d'abord, si ce n'est pas déjà fait, suivre notre index de paquet :

```shell
brew tap logisparte/packages
```

Puis installer le paquet :

```shell
brew install kano
```

## Utiliser

### Initialisation

Initialiser le répertoire `.kano` à la racine de votre projet:

```shell
kano init
```

> Tout ce qui est relié à kano sera dans ce répertoire

### Tâches

Définir toutes les tâches que votre processus de développement nécessite dans `.kano/tasks`.
Puis, pour exécuter une tâche :

```shell
kano NOM_DE_LA_TACHE
```

#### Définir une tâche

Un fichier de tâche est un fichier shell sourceable. Il doit avoit le format suivant :

```shell
#!/bin/sh

un_nom_de_tache() {
  # Votre code
}

```

Son nom doit être le même que le nom de sa fonction (ici `un_nom_de_tache`) et n'avoir aucune
extension

#### Environnement

Avant d'exécuter une tâche, kano source `.kano/environment`, s'il existe. Exportez-y toutes les
variables d'environnement que vos tâches nécessitent.

## Développer

### Préalables

Le gestionnaire de paquet [Homebrew](https://github.com/Homebrew/brew) est requis. Pour
installer les dépendances nécessaires :

```shell
brew bundle install
```

### Setup

Les _git hooks_ sont utilisés pour assurer l'intégrité des commits. Pour installer les _git
hooks_ :

```shell
kano setup
```

> Faire juste après avoir cloné le dépôt

### Teardown

Pour défaire tout ce que `setup` a fait :

```shell
kano teardown
```

### Test

[ShellSpec](https://github.com/shellspec/shellspec) est utilisé pour tester le code shell. Pour
rouler tous les tests :

```shell
kano test
```

### Format

[shfmt](https://github.com/mvdan/sh) est utilisé pour formatter les fichiers shell.
[Prettier](https://github.com/prettier/prettier) est utilisé pour formatter les fichiers
markdown et yaml. Pour formatter tous les fichiers :

```shell
kano format
```

> Le _git hook_ `pre-commit` s'assure que le code commité est formatté

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) est utilisé pour linter le code shell.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) est utilisé pour linter le
code markdown. Pour linter tout le code :

```shell
kano lint
```

> Le _git hook_ `pre-commit` empêche de commiter du code avec des erreurs de lint

### Build

Pour bâtir le projet :

```shell
kano build
```

> Le répertoire `/build` contiendra l'artefact
