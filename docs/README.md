# kano

> Lire en [Français](/docs/README.fr.md)

Software engineering task management CLI

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

First, if not already done, track our package index:

```shell
brew tap logisparte/packages
```

Then install the package:

```shell
brew install kano
```

#### Manually

Download the package and run the installation script:

```shell
curl "https://github.com/logisparte/kano/releases/download/$VERSION/kano.tar.gz" | tar -xz
./kano/install
```

### Usage

See the [documentation](/docs/en/usage.md)

## Contributors

### Setup

Git hooks are used to ensure commit integrity. To install the git hooks:

```shell
kano setup
```

> This should be done right after cloning the repository

### Teardown

To undo whatever `setup` did:

```shell
kano teardown
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

### Format

[shfmt](https://github.com/mvdan/sh) is used to format shell files.
[Prettier](https://github.com/prettier/prettier) is used to format markdown and yaml files. To
format all files:

```shell
kano format
```

> The `pre-commit` git hook ensures commited code is formatted

### Lint

[ShellCheck](https://github.com/koalaman/shellcheck) is used to lint shell code.
[MarkdownLint](https://github.com/igorshubovych/markdownlint-cli) is used to lint markdown code.
To lint all code:

```shell
kano lint
```

> The `pre-commit` git hook prevents committing code with lint errors

### Build

To build the project:

```shell
kano build
```

> The `/build` directory will contain the artifact
