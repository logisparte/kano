# docker

> Read in [English](/docs/en/tasks/docker.md)

## Description

Utiliser la tâche `docker` pour exécuter d'autres tâches dans un conteneur Docker

> Cette tâche requiert [Docker](https://github.com/docker)

## Usage

Si un `Dockerfile` est présent dans le répertoire `.kano` local, il sera utilisé pour créer
l'image de l'environnement de développement du projet. L'image de développement devrait contenir
toutes le dépendances du projet

Pour bâtir l'image de développement du projet:

```shell
kano docker build
```

> Les options usuelles de `docker build` peuvent être utilisées

Pour l'effacer :

```shell
kano docker delete
```

### Run

Pour exécuter une commande dans un conteneur de développement :

```shell
kano docker run COMMAND
```

> Les options usuelles de `docker run` peuvent être utilisées

Par défaut, ce conteneur:

- Sera non-persistent
- Ne créera pas de fichiers de log
- Aura le projet embarqué comme volume
- Aura le projet configuré comme répertoire de travail
