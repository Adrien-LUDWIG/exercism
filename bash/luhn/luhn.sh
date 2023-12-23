#!/usr/bin/env bash

quit() {
  echo "false"
  exit 0
}

sum=0
number=${1// /}

((${#number} <= 1)) && quit
[[ $number =~ ^[0-9]+$ ]] || quit

for i in $(seq 0 $((${#number} - 1))); do
  digit=${number:i:1}
  [[ $((i % 2)) == $((${#number} % 2)) ]] && ((digit *= 2))
  ((digit > 9)) && ((digit -= 9))
  ((sum += digit))
done

[[ $((sum % 10)) != 0 ]] && quit
echo "true"
