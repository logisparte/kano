# docker

> Lire en [Français](/docs/fr/tasks/docker.md)

## Description

Use the `docker` task to run other tasks inside a Docker container

> This task requires [Docker](https://github.com/docker)

## Usage

If a `Dockerfile` is present in the local `.kano` directory, it will be used to create the
project's development environment image. The development image should contain all of the
project's dependencies

### Build

To build the project's development image:

```shell
kano docker build
```

> Usual `docker build` options and flags may be provided

### Delete

To delete the project's development image:

```shell
kano docker delete
```

### Run

To run a command in a development container:

```shell
kano docker run COMMAND
```

> Usual `docker run` options and flags may be provided

By default, this container will:

- Be non-persistent
- Not create log files
- Have the project mounted as a volume
- Have the project set as the working directory
