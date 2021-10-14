# docker

> Read in [English](/docs/en/tasks/docker.md)

## Description

Utiliser la tâche `docker` pour travailler dans un conteneur de développement isolé

> Cette tâche requiert [Docker](https://github.com/docker)

## Usage

Si un `Dockerfile` est présent dans le répertoire `.kano` local, il sera utilisé pour créer
l'image de l'environnement de développement du projet. Cette image sera utilisée pour créer le
conteneur de développement et devrait contenir toutes les dépendances systèmes du projet

### Build

Pour bâtir l'image de développement du projet :

```shell
kano docker build
```

> Les options usuelles de `docker build` peuvent être utilisées

L'image sera nommée `${PROJECT_NAME}-dev`

> Le nom de l'image peut être personnalisé via la variable d'environnement
> `KANO_DEVELOPMENT_IMAGE` dans le fichier `.kano/environment` du projet

### Delete

Pour effacer l'image de développement du projet :

```shell
kano docker delete
```

### Run

Pour exécuter une commande dans un conteneur de développement éphémère :

```shell
kano docker run [OPTIONS] COMMANDE
```

> Les options usuelles de `docker run` peuvent être utilisées

Par défaut, ce conteneur:

- Aura un nom auto-généré
- Sera interactif
- Sera non-persistent
- Ne créera pas de fichiers de log
- Aura le répertoire du projet embarqué comme volume
- Aura le répertoire du projet configuré comme répertoire de travail

### Start

Pour démarrer un conteneneur de développement en arrière-plan afin de s'y attacher plus tard :

```shell
kano docker start [OPTIONS]
```

> Les options usuelles de `docker run` peuvent être utilisées

Par défaut, ce conteneur:

- Sera nommé `${PROJECT_NAME}-dev-container`
- Sera interactif
- Sera non-persistent
- Ne créera pas de fichiers de log
- Aura le répertoire du projet embarqué comme volume
- Aura le répertoire du projet configuré comme répertoire de travail

> Le nom du conteneur peut être personnalisé via la variable d'environnement
> `KANO_DEVELOPMENT_CONTAINER` dans le fichier `.kano/environment` du projet

### Stop

Pour arrêter le conteneur de développement en arrière-plan :

```shell
kano docker stop
```

### Attach

Pour s'attacher au conteneur de développement en arrière-plan :

```shell
kano docker attach
```

> Les options usuelles de `docker attach` peuvent être utilisées

Une fois attaché, pour quitter le conteneur :

```shell
exit
```
