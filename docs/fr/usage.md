# Usage

> Read in [English](/docs/en/usage.md)

## Initialisation

Initialiser le répertoire `.kano` à la racine d'un projet:

```shell
kano init
```

> Tout ce qui est relié à kano sera dans ce répertoire

## Tâches

Définir toutes les tâches que le processus de développement du projet nécessite dans
`.kano/tasks`. Puis, pour exécuter une tâche :

```shell
kano NOM_DE_LA_TACHE
```

### Définir une tâche

Un fichier de tâche est un fichier shell sourceable. Il doit avoit le format suivant :

```shell
#!/bin/sh

un_nom_de_tache() {
  # Le code
}

```

Son nom doit être le même que le nom de sa fonction (ici `un_nom_de_tache`) et n'avoir aucune
extension

## Niveaux

Kano cherche des tâches dans jusqu'à 4 différents niveaux, chacun représenté par un répertoire
spécifique :

|   Niveau    |     Répertoire      |       Disponibilité des tâches       |   Cherché   |
| :---------: | :-----------------: | :----------------------------------: | :---------: |
|   Projet    |    `$PWD/.kano`     |       Dans le projet seulement       | S'il existe |
| Utilisateur |  `$HOME/.kano_user` | Toujours pour l'utilisateur connecté | S'il existe |
|   Système   |     `/etc/kano`     |               Toujours               | S'il existe |
|  _Builtin_  |  Inclus dans kano   |               Toujours               |  Toujours   |

Quand l'exécution d'une tâche est demandée, kano cherche son fichier tout d'abord en projet
(s'il existe), puis en utilisateur (s'il existe), puis en système (s'il existe) et finalement en
_builtin_ jusqu'à ce qu'il le trouve. Si une tâche est définie dans 2 niveaux différents, le
fichier dans le premier niveau examiné sera utilisé. Pour outrepasser cette résolution, un
_flag_ peut être fourni

Pour forcer une résolution utilisateur :

```shell
kano -u une_tache
kano --user une_tache
```

Pour forcer une résolution système :

```shell
kano -s une_tache
kano --system une_tache
```

Pour forcer une résolution _builtin_ :

```shell
kano -b une_tache
kano --builtin une_tache
```

> Les tâches projet ont priorité par défaut

## Environnement

Un fichier d'environnement est un simple fichier shell qui exporte des variables qui seront
disponibles dans les tâches. Il peut y avoir un fichier d'environnement par niveau. Chaque
fichier environnement doit contenir des variables propres aux tâches de son niveau, ou encore
des redéfinitions de variables de niveaux supérieurs (voir ci-bas)

Quand kano exécute une tâche, il source tous les fichiers `environment` disponibles, du niveau
le plus haut jusqu'au niveau de la tâche, s'ils existent

|   Niveau    |             Fichier             | Environnements disponibles dans les tâches |
| :---------: | :-----------------------------: | :----------------------------------------: |
|   Projet    |    `$PWD/.kano/environment`     |       Projet, utilisateur et système       |
| Utilisateur |  `$HOME/.kano_user/environment` |           Utilisateur et système           |
|   Système   |     `/etc/kano/environment`     |             Système seulement              |

Par exemple, quand l'exécution d'une tâche projet est demandée, kano source d'abord le fichier
d'environnement système (s'il existe), puis le fichier d'environnement utilisateur (s'il existe)
puis finalement le fichier d'environnement projet (s'il existe). Ainsi, si une variable était
exportée à la fois dans le fichier projet et dans le fichier utilisateur, la valeur définie dans
le fichier projet aurait préséance

## Tâches _builtin_

Quelques tâches sont incluses avec kano. Elles sont reliées à kano en soi et son utilisation
générale

> Les tâches _builtin_ sont documentées [ici](/docs/fr/tasks)

## Helpers

Kano inclut une collection de fonctions compatibles avec POSIX qui simplifient l'écriture de
tâches. Pour les utiliser, les fichiers de tâches doivent simplement sourcer ceux qu'ils
requièrent :

```shell
#!/bin/sh

. "$KANO_HELPERS/confirm"
. "$KANO_HELPERS/report"
. "$KANO_HELPERS/succeed"
# ...
```

> Les _helpers_ sont documentés [ici](/docs/fr/helpers)
