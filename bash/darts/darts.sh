#!/usr/bin/env bash

x=$1
y=$2

if [[ $# != 2 || -n ${x//[0-9.-]/} || -n ${y//[0-9.-]/} ]]; then
  echo "Usage: darts <x> <y>"
  exit 1
fi

distance=$(bc <<<"scale=3; dist=sqrt(($x*$x+$y*$y)); scale=0; dist * 1000 / 1")

if [[ distance -gt 10000 ]]; then
  echo "0"
elif [[ distance -gt 5000 ]]; then
  echo "1"
elif [[ distance -gt 1000 ]]; then
  echo "5"
else # distance <= 10
  echo "10"
fi
