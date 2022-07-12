# docker

> Lire en [Français](/docs/fr/tasks/docker.md)

## Description

Use the `docker` task to work in an isolated development docker container

> This task requires [Docker](https://github.com/docker)

## Summary

- `kano docker` subcommands relay options and flags to their native `docker` CLI counterpart, if
  they have one
- The project must contain a `Dockerfile` from which the developement image will be built
- The image must contain all of the project's dependencies
- The container will be created from the image
- By default, the container will mount the project directory
- The container can also mount various host directories, files and environment variables,
  customizable by the user, optionally through higher `kano` scopes
- To use kano inside the container, `kano` must be installed in it too (until the self-mount
  feature is implemented)

| Variable                | Description                 | Default                         |
| :---------------------- | :-------------------------- | :------------------------------ |
| `KANO_DOCKER_FILE`      | Dockerfile path             | `.kano/Dockerfile`              |
| `KANO_DOCKER_REGISTRY`  | Docker registry URL, if any |                                 |
| `KANO_DOCKER_IMAGE`     | Development image name      | `${PROJECT_NAME}-dev`           |
| `KANO_DOCKER_CONTAINER` | Development container name  | `${PROJECT_NAME}-dev-container` |
| `KANO_DOCKER_TAG`       | Image tag to work with      | `latest`                        |

> The variable `KANO_DOCKER` will be set to `true` inside the container

## Usage

By default, if a `Dockerfile` is present in the local `.kano` directory, it will be used to
create the project's development environment image. This image will then be used to create the
development container

> The `Dockerfile` location can be customized using the `KANO_DOCKER_FILE` environment variable

### Image

The development image should contain all of the project's system dependencies. Ideally, a new
contributor should only be required to have `git`, `docker` and `kano` installed on the host
machine. Everything else should be installed inside the image, including `kano` (until the
self-mount feature is implemented)

#### image build

To build the project's development image:

```shell
kano docker image build [OPTIONS]

# or

kano docker build [OPTIONS]
```

> Usual `docker image build` options and flags may be provided

By default, this image will be named `${PROJECT_NAME}-dev`. Its name can be customized by
setting the `KANO_DOCKER_IMAGE` environment variable (preferably in the project's
`.kano/environment` file)

The built image's default tag is `latest`. Alternatively, the `KANO_DOCKER_TAG` can be set to
work on an already versioned image. In this case, the development image will fail to build and,
if not locally available, should be pulled instead. The resulting local
`$KANO_DOCKER_IMAGE:$KANO_DOCKER_TAG` will be referred to the _working image_ in the following
sections

#### image rm

To delete the working image:

```shell
kano docker image rm [OPTIONS]

# or

kano docker rmi [OPTIONS]
```

> Usual `docker image rm` options and flags may be provided

#### image tag

To tag the working image:

```shell
kano docker image tag TAG_NAME

# or

kano docker tag TAG_NAME
```

#### image pull

To pull the working image from the registry:

```shell
kano docker image pull [OPTIONS] [TAG_NAME]

# or

kano docker pull [OPTIONS] [TAG_NAME]
```

> Only available if the `KANO_DOCKER_REGISTRY` environment variable is set and the user has
> logged in using `docker login`. Usual `docker image pull` options and flags may also be
> provided

#### image push

To push the working image to the registry:

```shell
kano docker image pull [OPTIONS] [TAG_NAME]

# or

kano docker pull [OPTIONS] [TAG_NAME]
```

> Only available if the `KANO_DOCKER_REGISTRY` environment variable is set and the user has
> logged in using `docker login`. Usual `docker image push` options and flags may also be
> provided

### Container

The development container is created from the working image and is ephemeral. It is designed to
be reusable, but discarded when stopped. The container may be customized by mounting various
host directories, files and environment variables. It can be interacted with simply from the
command line, or by attaching an editor/IDE to it for increased productivity

#### container create

To create a container from the working image:

```shell
kano docker container create [OPTIONS]

# or

kano docker create [OPTIONS]
```

> Usual `docker container create` options and flags may also be provided

By default, this container will be named `${PROJECT_NAME}-dev-container`. Its name can be
customized by setting the `KANO_DOCKER_CONTAINER` environment variable (preferably in the
project's `.kano/environment` file). This container will also:

- Be ephemeral
- Be non-interactive
- Not create log files
- Mount the project directory as a volume
- Set the project directory as its working directory
- Have a password-less sudo user with the same name and home directory as the host user
- Set the environment variable `KANO_DOCKER` to `true`

#### container rm

To discard the created but unstarted container:

```shell
kano docker container rm [OPTIONS]

# or

kano docker rm [OPTIONS]
```

> Usual `docker container rm` options and flags may also be provided

#### container start

To start the created container:

```shell
kano docker container start [OPTIONS]

# or

kano docker start [OPTIONS]
```

> Usual `docker container start` options and flags may also be provided

#### container exec

To exec a command inside the running container:

```shell
kano docker container exec [OPTIONS] COMMAND

# or

kano docker exec [OPTIONS] COMMAND
```

> Usual `docker container exec` options and flags may also be provided

#### container stop

To stop and discard the running container:

```shell
kano docker container stop [OPTIONS]

# or

kano docker stop [OPTIONS]
```

> Usual `docker container stop` options and flags may also be provided

### Shortcuts

`kano docker` provides additional subcommands, that do not have native `docker` counterparts,
that help increase productivity

#### boot

To ensure there's a running development container:

```shell
kano docker boot
```

- If the development image does not exist, it will try to build it
- If the development container does not exist, it will create it
- If the development container is not running, it will start it

#### execute

To run a command in a development container:

```shell
kano docker execute [OPTIONS] COMMAND
```

- It will `kano docker boot`
- It will `kano docker container exec` the command in the running container

> `docker container exec` options and flags may also be provided

#### shell

To open an interactive login shell in a development container:

```shell
kano docker shell
```

- It will `kano docker execute` the same shell than the host's user `$SHELL`, or `/bin/sh` if
  not defined

> Tip: to close the shell and return the host, just use the `exit` command

#### clean

To remove all traces of kano development image and container for the current project:

```shell
kano docker clean
```

- If the development container is running, it will stop and discard it
- If the development container exists but is not running, it will discard it
- If the development image exists, it will delete it

## Examples

### Workflows

Building the image, creating the container, starting it and attaching
[Visual Studio Code](https://code.visualstudio.com) to it using the
[Remote - Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers):

```shell
kano docker boot
# Open the command palette in vscode
# Select "Remote - Containers: Attach to Running Container..."
# Select the project's development container
```

Opening a shell in the same container:

```shell
kano docker shell
```

Opening another shell in the same container:

```shell
# In a different terminal
kano docker shell
```

Running a command inside the container:

```shell
kano docker execute some_command
```

Stopping the container, discarding it and cleaning everything up:

```shell
kano docker clean
```

#### Visual Studio Code configuration

By default, VS Code tries to install its remote extension server in the container as `root`. If
the development image default user is not `root` (good practice), this operation will fail. To
correct this behavior, a configuration file setting the correct user for the container must
created. This file must only be created once per project, unless the container name changes.
[This kano task](/templates/vscode/tasks/configure_vscode) may be used to generate it
automatically

### Customizing the developement container

The development container can be customized using volumes, environment variables and more. The
most common use case would be to replicate one's personal development configurations inside the
container for increased productivity when working in it. The following sections will focus on
demonstrating this particular use case

#### Configuring customizations

The simplest way to configure the container is to create it using standard docker options and
flags. For example, to mount one's personal shell profile and git configuration, simply create
the container with the appropriate option:

```shell
kano docker container create \
  --volume $HOME/.profile:$HOME/.profile \
  --volume $HOME/.gitconfig:$HOME/.gitconfig \
  --volume $HOME/.gitignore_global:$HOME/.gitignore_global
```

While useful, having to manually type all desired options everytime a container is created may
prove tedious, most [shortcuts](#shortcuts) will also not pick them up. The best way to
customize containers is to use a proxying kano user task, also named `docker`. This task should
have the following form:

```shell
#!/bin/sh

docker_help() {
  echo "Proxies the builtin docker task with my personal configurations"
}

docker() {
  # shellcheck disable=SC2046
  kano --next docker $(_insert_my_personal_docker_options "$@" | xargs)
}

_insert_my_personal_docker_options() {
  if [ "$1" = "container" ]; then
    echo "$1" && shift
  fi

  if [ "$1" = "create" ]; then
    echo "$1" && shift
    _echo_my_container_create_options
  fi

  echo "$@"
}

_echo_my_container_create_options() {
  echo "--volume $HOME/.profile:$HOME/.profile"
  echo "--volume $HOME/.gitconfig:$HOME/.gitconfig"
  echo "--volume $HOME/.gitignore_global:$HOME/.gitignore_global"
}
```

> The proxy is made possible by the override `--next` flag. More information on override flags
> can be found [here](/docs/en/usage.md##scopes)

With such a proxying user task, all bare `kano docker container create` commands, including
[shortcuts](#shortcuts), will now include one's shell profile and git configurations. The same
principle could be applied with a proxying team task for team configurations, or directly in the
project for project-specific configurations, such as network names or exposed ports

#### Example customizations

There are many customizations one could possibly seek to configure. The followings are some
examples of options and flags that could be used in each case

##### TERM

To have consistent terminal colors with the host OS:

```shell
--env TERM="$TERM"
```

##### bash

To mount one's `bash` configuration:

```shell
--volume "$HOME/.bashrc:$HOME/.bashrc"
```

> `bash` must also be installed in the development image

##### zsh

To mount one's `zsh` configuration:

```shell
--volume "$HOME/.zshenv:$HOME/.zshenv"
--volume "$HOME/.zshrc:$HOME/.zshrc"
```

> `zsh` must also be installed in the development image

##### git

To mount one's `git` configuration:

```shell
--volume "$HOME/.gitconfig:$HOME/.gitconfig"
--volume "$HOME/.gitignore_global:$HOME/.gitignore_global"
```

> `git` must also be installed in the development image

##### vim

To mount one's vim configuration:

```shell
--volume "$HOME/.vim:$HOME/.vim"
--volume "$HOME/.vimrc:$HOME/.vimrc"
--env EDITOR="/usr/bin/vim"
```

> `vim` must also be installed in the development image

##### ssh

To mount one's `ssh` configuration:

```shell
--volume "$HOME/.ssh:$HOME/.ssh"
--volume "$SSH_AUTH_SOCK:$SSH_AUTH_SOCK"
--env SSH_AUTH_SOCK="$SSH_AUTH_SOCK"
```

This will forward the host's ssh agent in the docker container

> `ssh-client` must also be installed in the development image

###### ssh and macOS

If macOS Keychain is used to manage ssh passphrases, mounting the host's `ssh` configuration
will not work directly since Keychain will not be available in the container. To work around
this situation, the following configuration can be added to `$HOME/.ssh/config` to prompt for
passphrases once per session if Keychain is not found:

```text
IgnoreUnknown UseKeychain
UseKeychain yes
AddKeysToAgent yes
```

##### gpg

Although it's possible to have `gnupg2` installed in the container and the host's configuration
mounted, no way has been found yet to properly share GPG keys with the container that works with
both MacOS and Linux hosts because mounting the GPG socket
[will likely never be supported by Docker for Mac](https://github.com/docker/for-mac/issues/483).
A workaround with minimal impact on productivity is to simply use GPG outside the container for
actions that require one's GPG keys, such as signing a git commit or tag
