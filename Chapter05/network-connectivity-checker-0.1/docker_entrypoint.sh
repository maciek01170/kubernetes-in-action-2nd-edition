#!/bin/sh

host=${1:-1.1.1.1}
echo "Checking network connectivity to ${host} ..."

/bin/ping ${host} -c 1 >/dev/null 2>/dev/null
pingExitCode=$?
if [ $pingExitCode = 0 ]; then
  echo "Host $host appears to be reachable"
  exit 0
else
  echo "Host $host unreachable!"
  exit 1
fi
