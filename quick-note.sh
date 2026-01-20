#!/bin/bash
# Quick thought/note entry script
# Usage: ./quick-note.sh "your thought or note"

if [ -z "$1" ]; then
    echo "Usage: ./quick-note.sh \"your thought or note\""
    exit 1
fi

DATE=$(date +%Y-%m-%d)
TIME=$(date +%H:%M:%S)
TIMESTAMP="${DATE} ${TIME}"

# Append to thoughts file
FILENAME="thoughts/${DATE}.md"

if [ ! -f "$FILENAME" ]; then
    echo "# Thoughts - ${DATE}" > "$FILENAME"
    echo "" >> "$FILENAME"
fi

echo "### ${TIME}" >> "$FILENAME"
echo "$1" >> "$FILENAME"
echo "" >> "$FILENAME"

echo "✓ Thought saved to $FILENAME"
