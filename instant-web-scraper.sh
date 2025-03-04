#!/bin/bash
# Educational Proof of Concept: Instant Web Scraper
# WARNING: Ensure you comply with the target website’s terms of service.
#
# This script retrieves a webpage and extracts email addresses using grep.
# Usage: ./web_scraper.sh <url>
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <url>"
  exit 1
fi

URL=$1
echo "Fetching content from $URL..."
curl -s "$URL" | grep -E -o "\b[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}\b" | sort -u
