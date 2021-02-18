# help

> Read in [English](/docs/en/tasks/help.md)

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
