#!/bin/bash
set -euo pipefail

SEARCH_PATTERN="$1"
OUTPUT="${2:-results.txt}"

if [[ -e "$OUTPUT" ]]; then
    echo "Error: $OUTPUT already exists. Aborting." >&2
    exit 1
fi

curl -s -o mobydick.txt \
  "https://gist.githubusercontent.com/StevenClontz/4445774/raw/1722a289b665d940495645a5eaaad4da8e3ad4c7/mobydick.txt"

OCCURRENCES=$(grep -o -i "$SEARCH_PATTERN" mobydick.txt | wc -l)

{
    echo "The search pattern ${SEARCH_PATTERN} was found ${OCCURRENCES} time(s)."
    echo ""
    echo "Matching lines:"
    grep -i -n "$SEARCH_PATTERN" mobydick.txt | cut -d: -f1
} > "$OUTPUT"

echo "Done. Results written to $OUTPUT"
