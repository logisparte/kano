# kano

> Lire en [Français](/docs/README.fr.md)

Software engineering task management CLI

## About

> `κάνω` (phonetic: `káno`) is greek for "do" or "make"

Software engineering projects all have common development tasks, such as running tests,
formatting code, etc. The implementation of these tasks will vary depending on the language, the
tools the team uses and other such concerns. Most of the time, this is handled through custom
scripts that are either called from the command line directly or through the language's package
manager. Two projects may have different script setups for the same tasks, increasing the
cognitive cost of context switching between projects.

This is one of the problems `kano` solves. It structures your development tasks, regardless of
their actual implementations. It gives you a common interface to work with all your projects
without getting in your way.

### Example

Running tests with code coverage enabled in different projects of different languages may look
like this:

```shell
# In Swift
swift test -Xswiftc -suppress-warnings --enable-code-coverage

# In Javascript
karma start --coverage

# In Python
pipenv run coverage run --rcfile=setup.cfg -m unittest discover tests

# etc.
```

If you don't want to remember these lines by heart, you'll have to encapsulate them in a script
in each of these projects. Kano proposes to encapsulate these kind of scripts in a special
folder named `.kano` that follows a particular structure, enabling this:

```shell
# Running tests with coverage in all your project will now look like this
kano test
```

Beside this immediate benefit, the uniformization also enables Kano to :

- Generate tasks from templates based on language, architecture or other criterias
- Completely encapsulate the development environment in a Docker container (to avoid _It works
  on my machine™_ problems)
- Support external integrations through its lightweight modular architecture

## License

Kano is _free as in freedom_, under the terms of the [GPL-3.0 License](/LICENSE).
