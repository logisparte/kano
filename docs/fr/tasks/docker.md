# docker

> Read in [English](/docs/en/tasks/docker.md)

## Description

Utiliser la tâche `docker` pour travailler dans un conteneur de développement isolé

> Cette tâche requiert [Docker](https://github.com/docker)

## Résumé

- Les sous-commandes `kano docker` relaient leurs options à leur homologue native dans l'ILC
  `docker`, si elles en ont une
- Le projet doit contenir un `Dockerfile` à part duquel l'image de développement sera bâtie
- L'image doit contenir toutes les dépendances du projet
- Le conteneur de développement sera créé à partir de l'image
- Par défaut, `kano` s'auto-montera dans le conteneur
- Par défaut, le conteneur montera le répertoire du projet
- Le conteneur peut aussi monter plusieurs répertoires, fichiers et variables d'environnement de
  l'hôte, personnalisables par l'utilisateur, optionnellement via une tâche kano de portée
  externe au projet

<!-- markdownlint-disable line-length -->

| Variable                | Description                            | Valeur par défaut               |
| :---------------------- | :------------------------------------- | :------------------------------ |
| `KANO_DOCKER_FILE`      | Chemin vers le Dockerfile              | `.kano/Dockerfile`              |
| `KANO_DOCKER_REGISTRY`  | URL du registre Docker, le cas échéant |                                 |
| `KANO_DOCKER_IMAGE`     | Nom de l'image de développement        | `${PROJECT_NAME}-dev`           |
| `KANO_DOCKER_CONTAINER` | Nom du conteneur de développement      | `${PROJECT_NAME}-dev-container` |
| `KANO_DOCKER_TAG`       | Marqueur de l'image à utiliser         | `latest`                        |

<!-- markdownlint-enable line-length -->

> The variable `KANO_DOCKER` will be set to `true` inside the container

## Usage

Par défaut, si un `Dockerfile` est présent dans le répertoire `.kano` local, il sera utilisé
pour créer l'image de l'environnement de développement du projet. Cette image sera utilisée pour
créer le conteneur de développement

> Le chemin vers le `Dockerfile` peut être personnalisé via la variable d'environnement
> `KANO_DOCKER_FILE`

### Image

L'image de développement devrait contenir toutes les dépendances **systèmes** du projet.
Idéalement, un nouveau contributeur n'aurait qu'à avoir `git`, `docker` et `kano` d'installé sur
sa machine hôte. Toutes les autres dépendances système devraient être installé dans l'image

#### image build

Pour bâtir l'image de développement du projet :

```shell
kano docker image build [OPTIONS]

# ou

kano docker build [OPTIONS]
```

> Les options usuelles de `docker image build` peuvent être utilisées

Par défaut, cette image sera nommée `${PROJECT_NAME}-dev`. Son nom peut être personnalisé via la
variable d'environnement `KANO_DOCKER_IMAGE` (préférablement dans le fichier `.kano/environment`
du projet)

Le marqueur par défaut de l'image bâtie sera `latest`. Il est également possible de travailler
sur une image versionnée en utilisant la variable d'environnement `KANO_DOCKER_TAG`. Dans ce
cas, l'image de développement ne pourra être bâtie et devra soit déjà être présente localement
ou téléchargée depuis un registre Docker. Cette image qualifiée
`$KANO_DOCKER_IMAGE:$KANO_DOCKER_TAG` sera appelée _image de travail_ dans les sections
suivantes

#### image rm

Pour effacer l'image de travail :

```shell
kano docker image rm [OPTIONS]

# ou

kano docker rmi [OPTIONS]
```

> Les options usuelles de `docker image rm` peuvent être utilisées

#### image tag

Pour marquer une image de travail :

```shell
kano docker image tag MARQUEUR

# ou

kano docker tag MARQUEUR
```

#### image pull

Pour télécharger une image de travail depuis le registre :

```shell
kano docker image pull [OPTIONS] [MARQUEUR]

# ou

kano docker pull [OPTIONS] [MARQUEUR]
```

> Disponible seulement si l'URL du registre Docker a été défini via la variable d'environnement
> `KANO_DOCKER_REGISTRY` et que l'utilisateur s'y est connecté via `docker login` au préalable.
> Les options usuelles de `docker image pull` peuvent être utilisées

#### image push

Pour téléverser une image de travail au registre :

```shell
kano docker image push [OPTIONS] [MARQUEUR]

# ou

kano docker push [OPTIONS] [MARQUEUR]
```

> Disponible seulement si l'URL du registre Docker a été défini via la variable d'environnement
> `KANO_DOCKER_REGISTRY` et que l'utilisateur s'y est connecté via `docker login` au préalable.
> Les options usuelles de `docker image push` peuvent être utilisées

### Conteneur

Le conteneur de développement est créé à partir de l'image de travail et est éphémère. Par souci
de productivité, il est conçu pour être réutilisable, mais supprimé lorsqu'arrêté. Le conteneur
peut être personnalisé en montant différents répertoires, fichiers et variables d'environnement
de l'hôte. On peut interagir avec lui simplement depuis la ligne de commande, ou en y attachant
un éditeur/EDI pour plus de productivité

#### container create

Pour créer un conteneur depuis l'image de travail :

```shell
kano docker container create [OPTIONS]

# ou

kano docker create [OPTIONS]
```

> Les options usuelles de `docker container create` peuvent être utilisées

Par défaut, ce conteneur sera nommé `${PROJECT_NAME}-dev-container`. Son nom peut être
personnalisé via la variable d'environnement `KANO_DOCKER_CONTAINER` (préférablement dans le
fichier `.kano/environment` du projet). De plus, ce conteneur :

- Sera éphémère
- Sera Non-interactif
- Ne créera pas fichiers de journalisation
- Montera le répertoire du projet en tant que volume
- Définira le répertoire du projet en tant que répertoire courant
- Aura un utilisateur _sudo_ sans mot de passe avec le même nom et répertoire personnel que
  l'utilisateur hôte
- Définira la variable d'environnement `KANO_DOCKER` à `true`

#### container rm

Pour supprimer le conteneur créé avant son démarrage :

```shell
kano docker container rm [OPTIONS]

# ou

kano docker rm [OPTIONS]
```

> Les options usuelles de `docker container rm` peuvent être utilisées

#### container start

Pour démarrer le conteneur créé :

```shell
kano docker container start [OPTIONS]

# ou

kano docker start [OPTIONS]
```

> Les options usuelles de `docker container start` peuvent être utilisées

#### container exec

Pour exécuter une commande à l'intérieur du conteneur en marche :

```shell
kano docker container exec [OPTIONS] COMMANDE

# ou

kano docker exec [OPTIONS] COMMANDE
```

> Les options usuelles de `docker container exec` peuvent être utilisées

#### container stop

Pour arrêter et supprimer le conteneur en marche :

```shell
kano docker container stop [OPTIONS]

# ou

kano docker stop [OPTIONS]
```

#### container kill

Pour terminer et supprimer le conteneur en marche :

```shell
kano docker container kill [OPTIONS]

# ou

kano docker kill [OPTIONS]
```

> Les options usuelles de `docker container kill` peuvent être utilisées

### Raccourcis

`kano docker` offre des sous-commandes additionnelles, qui n'ont pas d'homologues natives dans
l'ILC `docker`, mais qui aident à augmenter la productivité

#### boot

Pour s'assurer qu'un conteneur de développement est en marche :

```shell
kano docker boot
```

- Si l'image de développement n'existe pas, elle sera bâtie, à moins que `KANO_DOCKER_TAG` ne
  soit définie. Dans le cas échéant, l'image sera téléchargée depuis le registre défini par
  `KANO_DOCKER_REGISTRY`
- Si le conteneur de développement n'existe pas, il sera créé
- Si le conteneur de développement n'est pas en marche, il sera démarré

#### execute

Pour exécuter une commande dans un conteneur de développement :

```shell
kano docker execute [OPTIONS] COMMANDE
```

- `kano docker boot` sera appelé
- La commande sera ensuite passée à `kano docker container exec`

> Les options de `docker container exec` peuvent être utilisées

#### shell

Pour ouvrir une interface système interactive dans un conteneur de développement :

```shell
kano docker shell
```

- `kano docker execute` sera appelé avec la même interface système définie par la variable
  d'environnement `SHELL` de l'utilisateur hôte, ou `/bin/sh` si elle n'est pas définie

> Astuce: pour fermer l'interface système et retourner à l'hôte, simplement utiliser la commande
> `exit`

#### clean

Pour effacer toutes traces de l'image et du conteneur de développement pour le project courant :

```shell
kano docker clean
```

- Si le conteneur de développement est en marche, il sera arrêté et supprimé
- Si le conteneur de développement existe mais n'est pas en marche, il sera supprimé
- Si l'image de développement existe, elle sera supprimée

## Exemples

### Processus de travail

Bâtir l'image, créer et démarrer le conteneur puis y attacher
[Visual Studio Code](https://code.visualstudio.com) en utilisant l'extension
[Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
:

```shell
kano docker boot
# Ouvrir la palette de commandes dans VS Code
# Sélectionner "Remote - Containers: Attach to Running Container..."
# Sélectionner le conteneur de développement du projet
```

Ouvir une interface système dans ce même conteneur :

```shell
kano docker shell
```

Ouvir une autre interface système dans ce même conteneur :

```shell
# Dans un autre terminal
kano docker shell
```

Exécuter une commande dans ce même conteneur :

```shell
kano docker execute une_commande
```

Arrêter et supprimer le conteneur puis l'image :

```shell
kano docker clean
```

#### Configuration Visual Studio Code

Par défaut, l'extension essait d'installer son serveur distant dans le conteneur en tant que
`root`. Si l'utilisateur par défaut de l'image de développement n'est pas `root` (bonne
pratique), cette opération échouera. Pour corriger ce comportement, un fichier de configuration
définissant le bon utilisateur à utiliser pour ce conteneur doit être créé. Ce fichier ne doit
être créé qu'une seule fois par projet, à moins que le nom du conteneur change.
[Cette tâche kano](/templates/vscode/tasks/configure_vscode) peut être utilisée pour le générer
automatiquement

### Personnaliser le conteneur de développement

Le conteneur de développement peut être personnalisé en utilisant des volumes, des variables
d'environnement et plus encore. Le cas d'usage le plus commun serait de répliquer des
configurations de développement personnelles présente sur l'hôte afin d'augmenter la
productivité une fois connecté au conteneur. Les sections suivantes se concentreront sur ce cas
particulier

#### Configurer les personnalisations

La manière la plus simple de configurer le conteneur est de le créer en utilisant des options
`docker` standard. Par exemple, pour monter un profile d'interface système et une configuration
`git`, simplement créer un conteneur avec les options appropriées :

```shell
kano docker container create \
  --volume $HOME/.profile:$HOME/.profile \
  --volume $HOME/.gitconfig:$HOME/.gitconfig \
  --volume $HOME/.gitignore_global:$HOME/.gitignore_global
```

Bien qu'utile, entrer manuellement toutes les options désirées à chaque fois qu'un conteneur est
créé pourrait s'avérer fastidieux. De plus, plusieurs [raccourcis](#raccourcis) n'en tiendront
pas compte. Le meilleur moyen de configurer ces personnalisations est d'utiliser une tâche kano
utilisateur procuratoire, aussi nommée `docker`. Cette tâche devrait avoir la forme suivante :

```shell
#!/bin/sh

docker_help() {
  echo "Proxies the builtin docker task with my personal configurations"
}

docker() {
  # shellcheck disable=SC2046
  kano --next docker $(_insert_my_personal_docker_options "$@" | xargs)
}

_insert_my_personal_docker_options() {
  if [ "$1" = "container" ]; then
    echo "$1" && shift
  fi

  if [ "$1" = "create" ]; then
    echo "$1" && shift
    _echo_my_container_create_options
  fi

  echo "$@"
}

_echo_my_container_create_options() {
  echo "--volume $HOME/.profile:$HOME/.profile"
  echo "--volume $HOME/.gitconfig:$HOME/.gitconfig"
  echo "--volume $HOME/.gitignore_global:$HOME/.gitignore_global"
}
```

> La procuration est rendue possible par l'option `--next` qui délègue l'exécution de la tâche à
> la portée suivante. Pour plus d'information sur les options, voir
> [ceci](/docs/fr/usage.md##scopes)

Avec une telle tâche utilisateur, tous les conteneurs créés par `kano docker container create`,
incluant les [raccourcis](#raccourcis), incluront maintenant le profile d'interface système et
la configuration `git` de l'utilisateur hôte. Le même principe pourrait être appliqué avec une
tâche d'équipe pour des configurations communes d'équipe, ou directement dans le projet pour des
configurations spécifiques au projet, comme un nom de réseau local particulier ou des ports à
exposer

#### Exemples de personnalisations

Un utilisateur pourrait vouloir configurer plusieurs types de personnalisations. Les
sous-sections suivantes en présentent quelques exemples

##### TERM

Pour avoir les mêmes couleurs de terminal que sur l'hôte :

```shell
--env TERM="$TERM"
```

##### bash

Pour avoir la même configuration `bash` que sur l'hôte :

```shell
--volume "$HOME/.bashrc:$HOME/.bashrc"
```

> `bash` doit aussi être installé dans l'image de développement

##### zsh

Pour avoir la même configuration `zsh` que sur l'hôte :

```shell
--volume "$HOME/.zshenv:$HOME/.zshenv"
--volume "$HOME/.zshrc:$HOME/.zshrc"
```

> `zsh` doit aussi être installé dans l'image de développement

##### git

Pour avoir la même configuration `git` que sur l'hôte :

```shell
--volume "$HOME/.gitconfig:$HOME/.gitconfig"
--volume "$HOME/.gitignore_global:$HOME/.gitignore_global"
```

> `git` doit aussi être installé dans l'image de développement

##### vim

Pour avoir la même configuration `vim` que sur l'hôte :

```shell
--volume "$HOME/.vim:$HOME/.vim"
--volume "$HOME/.vimrc:$HOME/.vimrc"
--env EDITOR="/usr/bin/vim"
```

> `vim` doit aussi être installé dans l'image de développement

##### ssh

Pour avoir la même configuration `ssh` que sur l'hôte :

```shell
--volume "$HOME/.ssh:$HOME/.ssh"
--volume "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK"
--env SSH_AUTH_SOCK="$SSH_AUTH_SOCK"
```

Cela relaiera l'agent `ssh` de l'hôte dans le conteneur de développement

> `ssh-client` doit aussi être installé dans l'image de développement

###### ssh et macOS

Si _macOS Keychain_ est utilisé pour gérer les phrases secrètes `ssh`, monter la configuration
`ssh` de l'hôte ne fonctionnera pas directement puisque _Keychain_ ne sera pas accessible depuis
le conteneur. Pour pallier à cette situation, la configuration suivante peut être ajoutée à
`$HOME/.ssh/config` pour demander la phrase secrète une fois par session si _Keychain_ n'est pas
trouvé :

```text
IgnoreUnknown UseKeychain
UseKeychain yes
AddKeysToAgent yes
```

##### gpg

Bien qu'il soit possible d'avoir `gnupg2` installé dans le conteneur et la configuration `gpg`
de l'hôte montée, aucun moyen n'a encore été trouvé pour correctement partager des clés `gpg`
avec le conteneur qui fonctionne tant sur Linux que sur macOS. Ceci est grandement dû au fait
que
[_Docker for Mac_ ne supportera pas le montage de socket unix](https://github.com/docker/for-mac/issues/483),
et donc le montage du socket GPG. Une solution palliative avec l'impact le plus minimal sur la
productivité est de simplement utliser `gpg` en dehors du conteneur lorsque les clés de
l'utilisateur hôte sont requises, pour par exemple signer des commits ou des marqueurs git
