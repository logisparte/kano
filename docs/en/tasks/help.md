# help

> Lire en [Français](/docs/fr/tasks/help.md)

Use the `help` task in any directory to list all available tasks and their description. It's
also the default task if no task name is provided

To define a help description for a task, define a function in the task's file with the same name
as the task, but with the `_help` suffix:

```shell
#!/bin/sh

some_task_name_help() {
  echo "Some help description"
}

some_task_name() {
  # The code
}
```
