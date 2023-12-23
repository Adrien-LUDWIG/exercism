#!/usr/bin/env bash
TZ=UTC printf '%(%Y-%m-%dT%H:%M:%S)T\n' $(($(date -u -d "$1" +%s) + 1000000000))
