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

Quand kano exécute une tâche, il source son fichier d'environnement correspondant, s'il existe.
Il peut y avoir un fichier d'environnement par niveau :

- Niveau projet => `$PWD.kano/environment`
- Niveau user => `$HOME/.kano_user/environment`
- Niveau système => `/etc/kano/environment`

Exporter toutes les variables d'environnement requises par les tâches du niveau dans ce fichier

> À l'exécution d'une tâche projet, le fichier d'environnement utilisateur ne sera pas sourcé et
> vice versa

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
