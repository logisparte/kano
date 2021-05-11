# docker

> Read in [English](/docs/en/tasks/docker.md)

## Description

Utiliser la tâche `docker` pour exécuter d'autres tâches dans un conteneur Docker

> Cette tâche requiert [Docker](https://github.com/docker)

## Usage

Si un `Dockerfile` est présent dans le répertoire `.kano` local, il sera utilisé pour créer
l'image de l'environnement de développement du projet. Cette image sera utilisée pour créer le
conteneur de développement et devrait contenir toutes le dépendances du projet

### Build

Pour bâtir l'image de développement du projet :

```shell
kano docker build
```

> Les options usuelles de `docker build` peuvent être utilisées

L'image sera nommée `kano_${PROJECT_NAME}`

### Delete

Pour effacer l'image de développement du projet :

```shell
kano docker delete
```

### Run

Pour exécuter une commande dans un conteneur de développement éphémère :

```shell
kano docker run [OPTIONS] COMMAND
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

- Sera nommé `kano_${PROJECT_NAME}_container`
- Sera interactif
- Sera non-persistent
- Ne créera pas de fichiers de log
- Aura le répertoire du projet embarqué comme volume
- Aura le répertoire du projet configuré comme répertoire de travail

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
