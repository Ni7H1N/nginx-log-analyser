#!/usr/bin/env bash
# Minimal nginx log analyser - reads a file (or stdin) and prints top 5 lists
set -euo pipefail

TOP_N=5
LOGFILE="-"

if [[ $# -gt 0 ]]; then
  LOGFILE="$1"
fi

if [[ "$LOGFILE" == "-" ]]; then
  tmp=$(mktemp)
  cat - > "$tmp"
  LOGFILE="$tmp"
  trap 'rm -f "$tmp"' EXIT
fi

top_ips() {
  awk '{print $1}' "$LOGFILE" | sort | uniq -c | sort -rn | head -n $TOP_N
}
top_paths() {
  awk 'match($0, /"([^"]*)"/, a){ split(a[1], p, " "); if(length(p)>=2) print p[2] }' "$LOGFILE" \
    | sort | uniq -c | sort -rn | head -n $TOP_N
}
top_status() {
  awk 'match($0, /"[^"]*"[[:space:]]+([0-9]{3})/, b){print b[1]}' "$LOGFILE" \
    | sort | uniq -c | sort -rn | head -n $TOP_N
}
top_agents() {
  awk '{
    if (match($0, /"([^"]*)"[[:space:]]*$/, a)) { print a[1]; next }
    if (match($0, /"[^"]*" "([^"]*)" "([^"]*)"/, b)) print b[2]
  }' "$LOGFILE" | sort | uniq -c | sort -rn | head -n $TOP_N
}

echo "Top $TOP_N IP addresses with the most requests:"
top_ips | awk '{printf "%s - %s requests\n", $2, $1}'
echo
echo "Top $TOP_N most requested paths:"
top_paths | awk '{printf "%s - %s requests\n", $2, $1}'
echo
echo "Top $TOP_N response status codes:"
top_status | awk '{printf "%s - %s requests\n", $2, $1}'
echo
echo "Top $TOP_N user agents:"
top_agents | awk '{ $1=$1; sub(/^ +/,""); ua=$0; cnt=$1; print substr(ua, index(ua,$2)) " - " cnt " requests"}'
