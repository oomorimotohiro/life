#!/bin/bash
# Quick daily entry script
# Usage: ./quick-daily.sh ["optional content"]

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
FILENAME="Daily/${DATE}.md"

# Create or append to daily file
if [ ! -f "$FILENAME" ]; then
    echo "# Daily Log - ${DATE}" > "$FILENAME"
    echo "" >> "$FILENAME"
fi

# If content is provided as argument, append it
if [ -n "$1" ]; then
    echo "## ${TIME}" >> "$FILENAME"
    echo "$1" >> "$FILENAME"
    echo "" >> "$FILENAME"
    echo "✓ Entry added to $FILENAME"
else
    # If no argument, open editor for input
    echo "" >> "$FILENAME"
    echo "## ${TIME}" >> "$FILENAME"
    echo "" >> "$FILENAME"
    ${EDITOR:-nano} "$FILENAME"
    echo "✓ Entry saved to $FILENAME"
fi
