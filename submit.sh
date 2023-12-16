#!/usr/bin/env bash

set -e

exercise=$(echo $PWD | awk -F/ '{print $(NF)}')
track=$(echo $PWD | awk -F/ '{print $(NF-1)}')

if [[ $(git ls-files --error-unmatch README.md 2>/dev/null) ]]; then
  type="iteration"
else
  type="solution"
fi

exercism submit
git add .
git commit -m "${track}/${exercise}: add ${type}"

if [[ $type == "iteration" ]]; then
  git commit --amend
else
  git push
fi
