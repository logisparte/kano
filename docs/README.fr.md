# kano

> Read in [English](/docs/README.md)

ILC d'automatisation de processus d'ingénierie logicielle

## À propos

> `κάνω` (phonétique : `káno`) signifie "faire" en grec

Les processus d'ingénierie logicielle sont composés de plusieurs types d'activités. Certaines de
ces activités (telles que la conception, la programmation, la documentation, etc.) sont
créatives et apportent une valeur directe au projet. D'autres (comme la compilation, l'exécution
de tests, la mise en forme de code, etc.), bien qu'elles soient aussi essentiels, n'en apportent
pas. Une équipe d'ingénierie efficace devrait s'efforcer d'automatiser autant que possible ce
genre d'activité sans valeur ajoutée

`kano` est un outil qui aide justement à faire cela

### Tâches (scripts conventionnés)

Les activités sans valeur ajoutée peuvent souvent être complètement ou partiellement
automatisées avec des scripts. L'implémentation de ces scripts dépend du langage de
programmation, des outils et des processus utilisés par l'équipe. Pour les projets simples, des
scripts d'une ligne intégrés dans la configuration du gestionnaire de paquets du langage peuvent
souvent suffire. Mais à mesure que les projets évoluent, ces lignes ont tendance à devenir des
fichiers de script entiers orchestrant plusieurs outils et utilitaires

Les fichiers de script sont extrêmement utiles, mais ont la mauvaise habitude de devenir
illisibles et difficiles à maintenir. D'un projet à l'autre, ils varient souvent en structure,
format et qualité de documentation (s'il y'en a). Pire encore, certains peuvent se retrouver à
être copiés-collés entre plusieurs projets, multipliant ainsi les efforts futurs nécessaires
pour les modifier. Tous ces petits inconvénients s'additionnent et peuvent induire des coûts
indésirables de charge cognitive, de maintenance et d'intégration qui peuvent en partie annuler
les gains en efficacité que ces scripts auraient initialement pu faire gagner à l'équipe

Ce sont là quelques-uns des problèmes que `kano` vise à résoudre. Il propose une convention pour
organiser, formater, documenter et exécuter des scripts à travers les projets. Il structure les
scripts d'un projet en _tâches_ (scripts conventionnés) et fournit une interface de ligne de
commande simple pour les exécuter sans se mettre au travers du chemin. Il gère également
plusieurs portées de tâches pour permettre à une équipe de partager et de réutiliser facilement
un groupe de tâches ou à un ingénieur de personnaliser son flux de travail personnel

### Environnement de développement partagé avec Docker (facultatif)

Les tâches sont une partie importante de l'automatisation du travail sans valeur ajoutée, mais
pas le tableau complet. Comme les tâches sont exécutées dans un environnement (architecture CPU,
système d'exploitation, etc.), différents environnements peuvent produire des résultats
différents. Cet indéterminisme peut également annuler une partie des gains en efficacité que ces
tâches auraient initialement pu faire gagner à l'équipe

Pour que les tâches produisent des résultats déterministes, elles doivent être exécutées dans un
environnement déterministe. Cet environnement doit être partagé par tous les acteurs, y compris
les automates d'intégration continue (IC) et de déploiement continue (DC). La meilleure façon
d'y parvenir est d'utiliser [Docker](https://www.docker.com). `kano` a une tâche intégrée qui
simplifie le développement et l'exécution de tâches à l'intérieur d'un conteneur Docker. Il
accélère considérablement les processus IC/DC, le déboguage de problèmes d'environnement et à
l'intégration de nouveaux contributeurs

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
curl --silent --show-error --location \
  "https://github.com/logisparte/kano/releases/latest/download/kano.tar.gz" \
    | tar --extract --gzip
sudo ./kano/install
```

### Usage

Voir la [documentation](/docs/fr/usage.md)

## Contributeurs

### Docker

Une image Docker de dévelopment est utilisée afin d'encapsuler les dépendances du projet ainsi
que son environnement d'exécution. Pour bâtir l'image :

```shell
kano docker image build
```

> Voir le [guide d'utilisation Docker](/docs/fr/tasks/docker.md) pour plus d'informations

### Format

[shfmt](https://github.com/mvdan/sh) est utilisé pour formatter les fichiers shell.
[Prettier](https://github.com/prettier/prettier) est utilisé pour formatter les fichiers
markdown et yaml. Pour formatter les fichiers modifiés :

```shell
kano format
```

Pour formatter tous les fichiers :

```shell
kano format all
```

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) est utilisé pour analyser le code shell.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) est utilisé pour analyser le
code markdown. Pour analyser les fichiers modifiés :

```shell
kano lint
```

Pour analyser tous les fichiers :

```shell
kano lint all
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

> NOTE: Les _strings_ multilignes pourraient s'afficher comme non-couvertes à cause de cette
> [_issue_](https://github.com/SimonKagstrom/kcov/issues/145)

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

> `VERSION` devrait être en format sémantique standard ou un nom de beta (`beta-*`)
