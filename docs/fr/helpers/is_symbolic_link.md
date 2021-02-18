# is_symbolic_link

> Read in [English](/docs/en/helpers/is_symbolic_link.md)

## Description

Vérifier si un fichier est un lien symbolique vers un autre fichier ou un répertoire

> Équivalent de `[ -h CHEMIN_DU_FICHIER ]`, mais mockable

## Usage

```text
is_symbolic_link CHEMIN_DU_FICHIER

CHEMIN_DU_FICHIER: Le chemin du fichier à vérifier
```

## Exemples

Avec le contexte :

```shell
ln -s "/chemin/vers/sparte" "/chemin/vers/le/proxenoi_spartiate"
```

Utiliser avec une instruction `if` :

```shell
if is_symbolic_link "/chemin/vers/le/proxenoi_spartiate"; then
  # Le proxenoi parle au nom de Sparte
else
  # <L'exécution ne passera pas ici>
fi
```
