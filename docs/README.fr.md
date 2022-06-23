# kano

> Read in [English](/docs/README.md)

ILC d'automatisation de flux de travaux d'ingénierie logicielle

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

Ceci est un des problèmes que `kano` résout. Il structure le processus de développement en
_tâches_ qui peuvent être exécutées de la même manière à travers tous les projets, peu importe
leur implémentation. Cela donne une interface commune avec laquelle travailler à travers tous
les projets sans se mettre dans vos pattes

## Licence

Kano est _libre comme dans liberté_, sous les termes de la [licence GPL-3.0](/LICENSE)

## Utilisateurs

### Installation

L'Installation peut être faite avec [Homebrew](https://github.com/Homebrew/brew) ou manuellement
avec `curl`

#### Homebrew

Tout d'abord, si ce n'est pas déjà fait, suivre l'index de paquet de logisparte :

```shell
brew tap logisparte/packages
```

Puis installer le paquet :

```shell
brew install kano
```

#### Manuel

Télécharger le paquet et exécuter le script d'installation:

```shell
curl -L "https://github.com/logisparte/kano/releases/latest/download/kano.tar.gz" | tar -xz
./kano/install
```

### Usage

Voir la [documentation](/docs/fr/usage.md)

## Contributeurs

### Docker

Une image Docker de dévelopment est utilisée afin d'encapsuler les dépendances du projet ainsi
que son environnement d'exécution. Pour bâtir l'image :

```shell
kano docker build
```

> Voir le [guide d'utilisation Docker](/docs/fr/tasks/docker.md) pour plus d'informations

### Format

[shfmt](https://github.com/mvdan/sh) est utilisé pour formatter les fichiers shell.
[Prettier](https://github.com/prettier/prettier) est utilisé pour formatter les fichiers
markdown et yaml. Pour formatter tous les fichiers :

```shell
kano format
```

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) est utilisé pour analyser le code shell.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) est utilisé pour analyser le
code markdown. Pour analyser tout le code :

```shell
kano lint
```

### Test

[ShellSpec](https://github.com/shellspec/shellspec) est utilisé pour tester le code shell. Pour
rouler tous les tests :

```shell
kano test
```

### Coverage

[Kcov](https://github.com/SimonKagstrom/kcov) est utilisé pour mesurer la couverture de code
pendant les tests. Pour voir le rapport de couverture après une exécution des tests :

```shell
kano coverage
```

### Dev

Pour changer la version de `kano` utilisée à celle en développement :

```shell
kano dev on
```

> La version installée sera encore disponible à travers le symbole `_kano`

Pour la remettre à la version installée :

```shell
kano dev off
```

En tout temps, pour savoir quelle version est présentement utilisée :

```shell
kano dev
```

### Build

Pour bâtir le projet :

```shell
kano build
```

> Le répertoire `/build` contiendra l'artefact

### Clean

Pour effacer tous les fichiers générés (artefacts, rapports, etc.) :

```shell
kano clean
```

### Release

> Cette tâche ne devrait être exécutée que par le pipeline de déploiement continu

Pour publier une version du projet sur GitHub et mettre à jour l'index de paquet de logisparte :

```shell
kano release VERSION GIT_NAME GIT_EMAIL GITHUB_ACCESS_TOKEN
```

> `VERSION` devrait être en format sémantique standard ou un nom de beta
