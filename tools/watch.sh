#!/usr/bin/env bash
# usage: watch [command] [sleep duration]
while :; do 
  clear
  date
  echo ""
  bash -c "$1"
  echo ""
  echo "[ctrl-c to exit]"
  sleep ${2:-1}
done
