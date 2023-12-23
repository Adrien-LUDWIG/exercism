#!/usr/bin/env bash

die() {
  echo "$1"
  exit 1
}

is_numeric() {
  [[ $1 =~ ^[+-]?[0-9]+(.[0-9])?$ ]]
}

(($# != 2)) && die "Usage: darts <x> <y>"
(is_numeric "$1" && is_numeric "$2") || die "Arguments must be numeric values"

distance=$(bc <<<"scale=3; dist=sqrt(($1*$1+$2*$2)); scale=0; dist * 1000 / 1")

if [[ distance -gt 10000 ]]; then
  echo "0"
elif [[ distance -gt 5000 ]]; then
  echo "1"
elif [[ distance -gt 1000 ]]; then
  echo "5"
else # distance <= 10
  echo "10"
fi
