curl -L https://raw.githubusercontent.com/auditware/radar/main/install-radar.sh | bash

path="$1"
ignore="$2"
outfile="output.sarif"

if [ -n "$ignore" ]; then
  radar -p "$path" -o "$outfile" --ignore "$ignore"
else
  radar -p "$path" -o "$outfile"
fi