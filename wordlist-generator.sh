#!/bin/bash
# Educational Proof of Concept: Wordlist Generator (Social Engineering)
# WARNING: Use only for authorized security testing and research.
#
# This script generates a simple wordlist based on provided keywords.
# Usage: ./wordlist_generator.sh keyword1 [keyword2] ...
if [ "$#" -lt 1 ]; then
  echo "Usage: $0 <keyword1> [keyword2] ..."
  exit 1
fi

OUTPUT_FILE="wordlist.txt"
echo "Generating wordlist..."
for word in "$@"; do
  echo "$word" >> "$OUTPUT_FILE"
  echo "${word}123" >> "$OUTPUT_FILE"
  echo "${word}2025" >> "$OUTPUT_FILE"
  echo "${word}!" >> "$OUTPUT_FILE"
done

echo "Wordlist saved to $OUTPUT_FILE."
