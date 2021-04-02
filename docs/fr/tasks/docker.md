# docker

> Read in [English](/docs/en/tasks/docker.md)

## Description

Utiliser la tâche `docker` pour exécuter d'autres tâches dans un conteneur Docker

> Cette tâche requiert [Docker](https://github.com/docker)

## Usage

Si un `Dockerfile` est présent dans le répertoire `.kano` local, il sera utilisé pour créer
l'image de l'environnement de développement du projet. L'image de développement devrait contenir
toutes le dépendances du projet, incluant `kano` (voir
[installation manuelle](/docs/README.fr.md####Manuellement))

Pour bâtir l'image de développement du projet:

```shell
kano docker build
```

> Les options usuelles de `docker build` peuvent être utilisées
