# dockered

> Read in [English](/docs/en/tasks/dockered.md)

## Description

Utiliser la tâche `dockered` pour exécuter une tâche dans un conteneur de développement

> Voir la documentation de la tâche [docker](/docs/fr/tasks/docker.md) pour plus d'informations

## Usage

Pour exécuter une tâche dans un conteneur de développement :

```shell
kano dockered TÂCHE
```

Si l'appel est fait dans un conteneur de développement, la tâche s'exécutera normalement.
Autrement, elle sera déléguée à :

```shell
kano docker execute kano TÂCHE
```
