# does_socket_exist

> Read in [English](/docs/en/helpers/does_socket_exist.md)

## Description

Vérifier si un socket existe

> Équivalent de `[ -S CHEMIN_DU_SOCKET ]`, mais mockable

## Usage

```text
does_socket_exist CHEMIN_DU_SOCKET

CHEMIN_DU_SOCKET: Le chemin vers le socket à vérifier
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if does_socket_exist "/pourparlers/pourparler_de_paix_avec_athènes.sock"; then
  # Négocier une paix avec Athènes
else
  # Attaquer Athènes!
fi
```
