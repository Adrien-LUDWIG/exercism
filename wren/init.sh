#!/bin/sh

# Exit on error
set -e

# Install packages
wrenc "package.wren" install

# Replace every `skip` by `do` after line 5 (where `skip` and `do` are defined)
sed -i "5,\$s/skip/do/g" *.spec.wren

# Launch tests to see them fail
wrenc *.spec.wren
