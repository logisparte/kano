# docker

> Lire en [Français](/docs/fr/tasks/docker.md)

## Description

Use the `docker` task to run other tasks inside a Docker container

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
- Be interactive
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
