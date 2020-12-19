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
contributeurs

Ceci est un des problèmes que `kano` résout. Il structure vos processus de développement en
_tâches_ qui peuvent être exécutées de la même manière à travers tous vos projets, peu importe
leur implémentation. Cela vous donne une interface commune avec laquelle travailler à travers
tous vos projets sans se mettre dans vos pattes

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
  # Le code
}

```

Son nom doit être le même que le nom de sa fonction (ici `un_nom_de_tache`) et n'avoir aucune
extension

### Niveaux

Kano cherche des tâches dans 3 différents niveaux, chacun représenté par un dossier spécifique :

- Niveau local => `.kano` (spécifique au projet)
- Niveau global => `~/.kano_global` (spécifique à l'utilisateur)
- Niveau _builtin_ => Inclus dans l'installation de kano (spécifique à kano)

Quand l'exécution d'une tâche est demandée, kano cherche son fichier tout d'abord en local, puis
en global et finalement en _builtin_ jusqu'à ce qu'il le trouve. Si une tâche est définie dans 2
niveaux différents, le fichier dans le premier niveau examiné sera utilisé. Pour outrepasser
cette résolution, un _flag_ peut être fourni

Pour forcer une résolution globale :

```shell
kano -g une_tache
kano --global une_tache
```

Pour forcer une résolution _builtin_ :

```shell
kano -b une_tache
kano --builtin une_tache
```

> Les tâches locales ont priorité par défaut

### Tâches _builtin_

Quelques tâches sont incluses avec kano. Elles sont reliées à kano en soi et son utilisation
générale

#### help

Utiliser la tâche `help` dans n'importe quel répertoire pour lister toutes les tâches
disponibles et leurs descriptions. C'est aussi la tâche par défaut si aucun nom de tâche n'est
fourni

Pour définir une description pour une tâche, définir une fonction dans le fichier de la tâche
avec le même nom que la tâche, mais avec le suffixe `_help` :

```shell
#!/bin/sh

un_nom_de_tache_help() {
  echo "Une description de tâche"
}

un_nom_de_tache() {
  # Le code
}
```

#### init

Utiliser la tâche `init` pour créer un répertoire kano vide. Pour créer un répertoire local
`.kano` vide :

```shell
kano init # ou kano init local
```

Pour créer un répertoire global `~/.kano_global` vide :

```shell
kano init global
```

#### destroy

Utiliser la tâche `destroy` pour effacer un répertoire kano. Pour effacer un répertoire local
`.kano` :

```shell
kano destroy # ou kano destroy local
```

Pour effacer le répertoire global `~/.kano_global` :

```shell
kano destroy global
```

### Environnement

Quand kano exécute une tâche, il source son fichier d'environnement correspondant, s'il existe.
Il peut y avoir un fichier d'environnement par niveau :

- Niveau local => `.kano/environment`
- Niveau global => `~/.kano_global/environment`

Exporter toutes les variables d'environnement requises par les tâches du niveau dans ce fichier

> À l'exécution d'une tâche locale, le fichier d'environnement global ne sera pas sourcé et vice
> versa

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
