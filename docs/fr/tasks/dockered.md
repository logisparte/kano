# dockered

> Read in [English](/docs/en/tasks/dockered.md)

## Description

Utiliser la tâche `dockered` pour exécuter une tâche dans un conteneur de développement éphémère

## Usage

Pour exécuter une tâche dans un conteneur de développement :

```shell
kano dockered TÂCHE
```

> `kano` doit aussi être installé dans l'image de développement

### Note

Cette tâche utilise la tâche [docker](/docs/fr/tasks/docker.md) et est un équivalent à :

```shell
kano docker run kano TÂCHE
```
