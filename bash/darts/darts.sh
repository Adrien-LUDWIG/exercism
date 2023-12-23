#!/usr/bin/env bash

die() {
  echo "$1"
  exit 1
}

is_numeric() {
  [[ $1 =~ ^[+-]?[0-9]+(.[0-9])?$ ]]
}

(($# != 2)) && die "Usage: darts <x> <y>"
for i; do is_numeric "$i" || die "Arguments must be numeric values"; done

bc <<<"
  scale=3
  dist=sqrt(($1*$1+$2*$2))

  if (dist > 10) {
    0
  } else if (dist > 5) {
    1
  } else if (dist > 1) {
    5
  } else {
    10
  }
"
