#!/usr/bin/env bash

die() {
  echo "$*"
  exit 1
}

string=$1
string_length=${#1}
substring_length=$2

((string_length == 0)) && die "series cannot be empty"
((substring_length > string_length)) && die "slice length cannot be greater than series length"
((substring_length == 0)) && die "slice length cannot be zero"
((substring_length < 0)) && die "slice length cannot be negative"

for i in $(seq 0 $((string_length - substring_length))); do
  substrings+=("${string:i:substring_length}")
done

echo "${substrings[*]}"
