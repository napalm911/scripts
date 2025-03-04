#!/bin/bash
# Educational Proof of Concept: Auto Google Dorking
# WARNING: Automated querying may violate Google's terms of service.
# Use only for educational purposes on permitted targets.
#
# Usage: ./google_dork.sh "<dork_query>"
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 \"<dork_query>\""
  exit 1
fi

QUERY=$(echo "$1" | sed 's/ /+/g')
echo "Searching for: $1"
curl -s "https://www.google.com/search?q=$QUERY" | grep -oP '(?<=<a href="/url?q=)[^&]*'
