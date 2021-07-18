# docker

> Lire en [Français](/docs/fr/tasks/docker.md)

## Description

Use the `docker` task to work in an isolated development docker container

> This task requires [Docker](https://github.com/docker)

## Usage

If a `Dockerfile` is present in the local `.kano` directory, it will be used to create the
project's development environment image. This image will be used to create the development
container and should contain all of the project's system dependencies

### Build

To build the project's development image:

```shell
kano docker build
```

> Usual `docker build` options and flags may be provided

This image will be named `${PROJECT_NAME}-dev`

> The image name can be customized through the `KANO_DEVELOPMENT_IMAGE` environment variable in
> the project's `.kano/environment` file

### Delete

To delete the project's development image:

```shell
kano docker delete
```

### Run

To run a command in an ephemeral development container:

```shell
kano docker run [OPTIONS] COMMAND
```

> Usual `docker run` options and flags may be provided

By default, this container will:

- Have an auto-generated name
- Be non-interactive
- Be non-persistent
- Not create log files
- Have the project directory mounted as a volume
- Have the project directory set as the working directory

### Start

To start a development container in the background in order to attach to it later:

```shell
kano docker start [OPTIONS]
```

> Usual `docker run` options and flags may be provided

By default, this container will:

- Be named `${PROJECT_NAME}-dev-container`
- Be interactive
- Be non-persistent
- Not create log files
- Have the project directory mounted as a volume
- Have the project directory set as the working directory

> The container name can be customized through the `KANO_DEVELOPMENT_CONTAINER` environment
> variable in the project's `.kano/environment` file

### Stop

To stop the running development container:

```shell
kano docker stop
```

### Attach

To attach to the running development container:

```shell
kano docker attach
```

> Usual `docker attach` options and flags may be provided

When attached, to exit the container:

```shell
exit
```

## Customization

The development container can be tailored to a user preferences using a proxying user scope task
also named `docker` (more information on scopes [here](/docs/en/usage.md##scopes)). This task
should have the following form:

```shell
#!/bin/sh

docker_help() {
  echo "Proxies the builtin docker task with personal configurations"
}

docker() {
  SUBTASK="$1"

  case "$SUBTASK" in
    run | start)
      shift
      kano -b docker "$SUBTASK" \
        # custom docker run flags and options \
        "$@"
      ;;

    *)
      kano -b docker "$@"
      ;;
  esac
}
```

> The proxy is made possible by the override `-b` flag. More information on override flags can
> be found [here](/docs/en/usage.md##scopes)

The following sections describe how a user may want to customize the development container

### TERM

To have consistent terminal colors with the host OS:

```shell
--env TERM="$TERM" \
```

### bash

First, `bash` should be installed in the docker image and ideally set as the default shell:

```docker
# Dockerfile
CMD /bin/bash
RUN chsh -s /bin/bash root
```

Then, to mount a user `bash` configuration:

```shell
--volume "$HOME/.bashrc:/root/.bashrc" \
```

### zsh

First, `zsh` should be installed in the docker image and ideally set as the default shell:

```docker
# Dockerfile
CMD /bin/zsh
RUN chsh -s /bin/zsh root
```

Then, to mount a user `zsh` configuration:

```shell
--volume "$HOME/.zshenv:/root/.zshenv" \
--volume "$HOME/.zshrc:/root/.zshrc" \
```

### git

First, `git` should be installed in the docker image. Then, to mount a `git` user configuration:

```shell
--volume "$HOME/.gitconfig:/root/.gitconfig" \
```

### ssh

First, `ssh-client` should be installed in the docker image. Then, to mount an `ssh` user
configuration:

```shell
--volume "$HOME/.ssh:/root/.ssh" \
--volume "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK" \
--env SSH_AUTH_SOCK="$SSH_AUTH_SOCK" \
```

> Mouting the `$SSH_AUTH_SOCK` will forward the host's ssh agent in the docker container

#### ssh and macOS

If macOS Keychain is used to manage ssh passphrases, mounting the host's `ssh` configuration
will not work directly since Keychain will not be available in the container. To work around
this situation, the following configuration can be added to `$HOME/.ssh/config` to prompt for
passphrases once per session if Keychain is not found:

```text
IgnoreUnknown UseKeychain
UseKeychain yes
AddKeysToAgent yes
```

### gpg

First, `gnupg2` should be installed in the docker image. Then, to mount a `gpg` user
configuration:

```shell
--volume "$HOME/.gnupg:/root/.gnupg" \
```

#### gpg and macOS

If macOS Keychain is used to manage gpg passphrases, mounting the host's `gpg` configuration
will not work directly since Keychain will not be available in the container. To work around
this situation, the following configuration can be added to `$HOME/.gnupg/gpg.conf` and
`$HOME/.gnupg/gpg-agent.conf` respectively to prompt for passphrases once per session:

```text
use-agent
default-key KEY_ID
```

### gpg + ssh

- Add `enable-ssh-support` in `~/.gnupg/gpg-agent.conf`
- Generate gpg key subkey for authentication
  ([see](http://littlehandytips.com/using-gpg-for-ssh-access-on-github/))
  - but use ed25519 encryption
- Add subkey to `~/.gnupg/sshcontrol`
- Add the following to `.zshrc`:

```shell
#!/bin/sh

GPG_TTY=$(tty)
export GPG_TTY

# Configure SSH to go through GPG
SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
export SSH_AUTH_SOCK
gpgconf --launch gpg-agent
gpg-connect-agent updatestartuptty /bye > /dev/null
```

Still mount ssh configuration to keep known hosts:

```shell
--volume "$HOME/.ssh:/root/.ssh" \
```

### vim

The development image should have `vim` installed, and ideally set as the default editor:

```docker
# Dockerfile
ENV EDITOR="/usr/bin/vim"
```

To mount a vim user configuration, the following options should be added in the proxying docker
task:

```shell
--volume "$HOME/.vim:/root/.vim" \
--volume "$HOME/.vimrc:/root/.vimrc" \
```
