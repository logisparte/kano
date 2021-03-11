# am_i_root

> Lire en [Français](/docs/fr/helpers/am_i_root.md)

## Description

Check wether current user is the root user or not

## Usage

```text
am_i_root
```

## Examples

With context:

```shell
kano muster_hoplites
```

The following task will fail:

```shell
# tasks/muster_hoplites

if am_i_root; then
  # <Execution will never go through here>
else
  fail "Only a basileus may muster the army"
fi
```

With context:

```shell
sudo kano muster_hoplites
```

The following task will succeed:

```shell
# tasks/muster_hoplites

if am_i_root; then
  succeed "I'm a basileus, muster the army!"
else
  # <Execution will never go through here>
fi
```
