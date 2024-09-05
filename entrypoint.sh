#!/bin/bash

curl -L https://raw.githubusercontent.com/auditware/radar/main/install-radar.sh | bash

path="$1"
ignore="$2"
outfile="output.sarif"

if [ -n "$ignore" ]; then
  radar -p "$path" -o "$outfile" --ignore "$ignore"
else
  radar -p "$path" -o "$outfile"
fi

radar_exit_code=$?
if [ "$radar_exit_code" -ne 0 ]; then
  echo "Radar failed with exit status $radar_exit_code"
  exit $radar_exit_code
else
  echo "Radar completed successfully with exit code 0"
fi