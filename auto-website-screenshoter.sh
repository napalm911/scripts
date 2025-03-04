#!/bin/bash
# Educational Proof of Concept: Auto Website Screenshooter
# WARNING: Only capture screenshots of websites you are authorized to access.
#
# This script uses Google Chrome in headless mode to take a screenshot.
# Usage: ./website_screenshot.sh <url> <output_file.png>
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <url> <output_file.png>"
  exit 1
fi

URL=$1
OUTPUT_FILE=$2
google-chrome --headless --disable-gpu --screenshot="$OUTPUT_FILE" "$URL"
echo "Screenshot saved as $OUTPUT_FILE."
