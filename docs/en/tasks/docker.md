# docker

> Lire en [Français](/docs/fr/tasks/docker.md)

## Description

Use the `docker` task to run other tasks inside a Docker container

> This task requires [Docker](https://github.com/docker)

## Usage

If a `Dockerfile` is present in the local `.kano` directory, it will be used to create the
project's development environment image. This image will be used to create the development
container and should contain all of the project's dependencies

### Build

To build the project's development image:

```shell
kano docker build
```

> Usual `docker build` options and flags may be provided

This image will be named `kano_${PROJECT_NAME}`

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

- Be named `kano_${PROJECT_NAME}_container`
- Be interactive
- Be non-persistent
- Not create log files
- Have the project directory mounted as a volume
- Have the project directory set as the working directory

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
