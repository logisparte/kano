# cpu

> Read in [English](/docs/en/helpers/cpu.md)

## Description

Déterminer l'architecture du processeur sous-jacent

## Usage

Pour vérifier si l'architecture du processeur est ARM64 :

```text
cpu is_arm64
```

Pour vérifier si l'architecture du processeur est AMD64 (ou x86_64) :

```text
cpu is_amd64
```

## Exemples

Utiliser avec une instruction `if` :

```shell
if cpu is_arm64; then
  # Se battre aux côtés de ses frères d'armes

else
  # Mourir seul
fi
```
