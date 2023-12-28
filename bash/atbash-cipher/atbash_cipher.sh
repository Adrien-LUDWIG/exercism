#!/usr/bin/env bash

chr() {
  [ "$1" -lt 256 ] || return 1
  printf "\\$(printf '%03o' "$1")"
}

ord() {
  LC_CTYPE=C printf '%d' "'$1)"
}

encode() {
  string=${1,,}
  new_string=""

  for ((i = 0; i < ${#string}; i++)); do
    char=${string:i:1}
    if [[ "$char" =~ [a-z] ]]; then
      char=$(ord "$char")
      new_string+="$(chr "$((97 + 26 - ("$char" - 97) - 1))")"
    elif [[ $char =~ [0-9] ]]; then
      new_string+="$char"
    fi
  done

  for ((i = 0; i < ${#new_string}; i += 5)); do
    substrings+=("${new_string:i:5}")
  done

  echo "${substrings[*]}"
}

decode() {
  string=$1
  new_string=""

  for ((i = 0; i < ${#string}; i++)); do
    char=${string:i:1}
    if [[ "$char" =~ [a-z] ]]; then
      char=$(ord "$char")
      new_string+="$(chr "$((97 + 26 - ("$char" - 97) - 1))")"
    elif [[ $char =~ [0-9] ]]; then
      new_string+="$char"
    fi
  done

  echo "$new_string"
}

if [[ "$1" == "encode" ]]; then
  encode "$2"
else
  decode "$2"
fi
