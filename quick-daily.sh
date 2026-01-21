#!/bin/bash
# Quick daily entry script
# Usage: ./quick-daily.sh ["optional content"]

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)

# Create directory if it doesn't exist
mkdir -p Daily

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
    
    # Check if editor is available
    if command -v ${EDITOR:-nano} &> /dev/null; then
        ${EDITOR:-nano} "$FILENAME"
        echo "✓ Entry saved to $FILENAME"
    else
        echo "⚠ No editor available. Please edit $FILENAME manually."
    fi
fi
