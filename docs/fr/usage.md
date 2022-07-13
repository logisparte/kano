# Usage

> Read in [English](/docs/en/usage.md)

## Initialisation

Initialiser le répertoire `.kano` à la racine d'un projet:

```shell
kano init
```

> Tout ce qui concerne `kano` sera dans ce répertoire

## Tâches

Définir toutes les tâches que le processus de développement du projet nécessite dans
`.kano/tasks`. Puis, pour exécuter une tâche :

```shell
kano NOM_DE_LA_TACHE
```

### Définir une tâche

Un fichier de tâche est un fichier de script shell. Il doit avoit le format suivant :

```shell
#!/bin/sh

un_nom_de_tache() {
  # Le code
}

```

Son nom doit être le même que celui de sa fonction principale (ici `un_nom_de_tache`) et n'avoir
aucune extension

> `kano init task TASK_NAME` peut être utilisé afin de rapidement créer une tâche vide

## Portées

`kano` cherche des tâches jusque dans 5 différentes portées, chacune représentée par un
répertoire spécifique. De la plus interne à la plus externe, ces portées sont :

| Portée      | Répertoire                     | Disponibilité des tâches             |
| :---------- | :----------------------------- | :----------------------------------- |
| Projet      | `$PWD/.kano`                   | Dans le projet seulement             |
| Utilisateur | `$HOME/.kano_user`             | Toujours pour l'utilisateur          |
| Équipe      | `$HOME/.kano_teams/$KANO_TEAM` | Toujours pour l'utilisateur\*        |
| Système     | `/etc/kano`                    | Toujours, pour tous les utilisateurs |
| Intégrée    | Inclus dans kano               | Toujours, pour tous les utilisateurs |

> \* Si `$KANO_TEAM` est définie

Quand l'exécution d'une tâche est demandée, `kano` cherchera son fichier en partant de la portée
la plus interne disponible à la plus externe jusqu'à ce qu'il le trouve. Si une tâche est
définie dans plusieurs portées différentes, le premier fichier trouvé sera utilisé. Pour
outrepasser cette résolution, une option peut être passée

Pour forcer une résolution **utilisateur** :

```shell
kano -u une_tache

# ou

kano --user une_tache
```

Pour forcer une résolution **équipe** :

```shell
kano -t une_tache

# ou

kano --team une_tache
```

> La résolution équipe ne fonctionnera que si `$KANO_TEAM` est définie

Pour forcer une résolution **système** :

```shell
kano -s une_tache

# ou

kano --system une_tache
```

Pour forcer une résolution **_builtin_** :

```shell
kano -b une_tache

# ou

kano --builtin une_tache
```

L'option spéciale `-x` ou `--next` peut aussi être utilisée à l'intérieur d'une tâche pour
déléguer à la prochaine portée disponible. Ceci est utile lors d'une définition de tâche
procuratoire. Voir la
[documentation de la tâche docker](/docs/fr/tasks/docker.md#configurer-les-personnalisations)
pour un exemple concret

## Environnement

Un fichier d'environnement est un simple fichier shell qui exporte des variables qui seront
disponibles dans ses tâches connexes. Il peut y avoir un fichier d'environnement par portée.
Chaque fichier d'environnement doit contenir les variables propres aux tâches de sa portée, ou
encore des redéfinitions de variables de portées externes (voir ci-bas)

Quand `kano` exécute une tâche, il source d'abord tous les fichiers d'environnement disponibles
en ordre, de la portée la plus externe jusqu'à la portée de la tâche. Ainsi, si une variable
existe dans plusieurs portées, la valeur la plus interne sera utilisée

<!-- markdownlint-disable line-length -->

| Portée      | Fichier d'environnement                    | Environnements disponibles dans les tâches |
| :---------- | :----------------------------------------- | :----------------------------------------- |
| Projet      | `$PWD/.kano/environment`                   | Projet, utilisateur, équipe\* et système   |
| Utilisateur | `$HOME/.kano_user/environment`             | Utilisateur, équipe\* et système           |
| Équipe      | `$HOME/.kano_teams/$KANO_TEAM/environment` | Équipe\* et système                        |
| Système     | `/etc/kano/environment`                    | Système seulement                          |

> \* Si `$KANO_TEAM` est définie

<!-- markdownlint-enable line-length -->

## Tâches intégrées

Quelques tâches sont incluses avec `kano`. Elles sont reliées à `kano` en soi et son utilisation
générale

> Les tâches intégrées sont documentées [ici](/docs/fr/tasks)

## Helpers

`kano` inclut une collection de fonctions compatibles avec POSIX (_helpers_) qui simplifient
l'écriture de tâches. Leur utilisation est entièrement optionnelle. Pour les utiliser,
simplement sourcer les fichiers correspondant dans le haut du fichier de la tâche :

```shell
#!/bin/sh

. "$KANO_HELPERS/confirm"
. "$KANO_HELPERS/report"
. "$KANO_HELPERS/fail"
# ...

```

> Les _helpers_ sont documentés [ici](/docs/fr/helpers)
