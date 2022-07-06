# kano

> Lire en [Français](/docs/README.fr.md)

Software engineering workflow automation CLI

## About

> `κάνω` (phonetic: `káno`) is greek for "do" or "make"

Software engineering workflows are all composed of basic actions that engineers make multiple
times per day, such as running tests, formatting code, etc. The implementation of these actions
will vary depending on the language, the tools the team uses and other such concerns. Most of
the time, this is handled through one-liner scripts in the language's package manager
configuration. When things get more complex, these one-liners rapidly evolve into big untestable
scripts with varying folder structures and poor documentation. It drives up the maintenance
costs as well as the cognitive costs of switching between projects and onboarding new
contributors

This is one of the problems `kano` solves. It structures the development workflow in _tasks_
that can be run the same way across projects, regardless of their actual implementations. It
provides a common interface to work with across all projects without getting in the way

## License

`kano` is _free as in freedom_, under the terms of the [GPL-3.0 License](/LICENSE)

## Users

### Installation

Installation can be done either with [Homebrew](https://github.com/Homebrew/brew) or manually
with `curl`

#### Homebrew

First, if not already done, track logisparte's package index:

```shell
brew tap logisparte/packages
```

Then install the package:

```shell
brew install kano
```

#### Manual

Download the package and run the installation script:

```shell
curl --silent --show-error --location \
  "https://github.com/logisparte/kano/releases/latest/download/kano.tar.gz" \
    | tar --extract --gzip
sudo ./kano/install
```

### Usage

See the [documentation](/docs/en/usage.md)

## Contributors

### Docker

A development docker image is used to encapsulate project dependencies and runtime environment.
To build the image:

```shell
kano docker build
```

> See the [Docker user guide](/docs/en/tasks/docker.md) for more information

### Format

[shfmt](https://github.com/mvdan/sh) is used to format shell files.
[Prettier](https://github.com/prettier/prettier) is used to format markdown and yaml files. To
format all files:

```shell
kano format
```

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) is used to analyze shell code.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) is used to analyze markdown
code. To analyze all code:

```shell
kano lint
```

### Test

[ShellSpec](https://github.com/shellspec/shellspec) is used to test the source code. To run all
tests:

```shell
kano test
```

### Coverage

[Kcov](https://github.com/SimonKagstrom/kcov) is used to measure test coverage during tests. To
view the coverage report after a test run:

```shell
kano coverage
```

> NOTE: Multiline strings may report as uncovered due this
> [issue](https://github.com/SimonKagstrom/kcov/issues/145)

### Dev

To change the version of `kano` to the one under development:

```shell
kano dev on
```

> The installed version will still be available through the `_kano` symbol

To change it back to the installed version:

```shell
kano dev off
```

At any time, to know which version is currently used:

```shell
kano dev
```

### Build

To build the project:

```shell
kano build
```

> The `/build` directory will contain the artifact

### Clean

To delete all generated files (artifacts, reports, etc.):

```shell
kano clean
```

### Release

> This task should only be executed by the continuous delivery pipeline

To release a version of the project on GitHub and update logisparte's package index:

```shell
kano release VERSION GIT_NAME GIT_EMAIL GITHUB_ACCESS_TOKEN
```

> `VERSION` should be in standard semantic versioning format or a beta name
