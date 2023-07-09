# Bash

## Tests

Exercism ships the `bats-extra.bash` with every exercise to simplify users
experience. To avoid duplication I will only push it at the bash root.

This means that I must change the import in each test file, from:

```bash
load bats-extra.bash
```

to:

```bash
load ../bats-extra.bash
```

If tests fail with the error below, I forgot to change the import.

```bash
$ bats hello_world.bats
bats_load_safe: Could not find '/home/dreamexe/Documents/Dev/exercism/bash/hello-world/bats-extra'[.bash]
hello_world.bats
 ✗ setup_file failed
   (in test file hello_world.bats, line 2)
     `load bats-extra' failed with status 0

1 test, 1 failure
```

## Resources

### Explored

### Used

- Bash man page

## VSCode extensions

- [Bash Debug]()
- [Bash IDE]()
- [ShellCheck]()
- [shell-format]()
