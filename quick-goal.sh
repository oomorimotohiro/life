#!/bin/bash
# Quick goal entry script
# Usage: ./quick-goal.sh "goal title" ["optional description"]

if [ -z "$1" ]; then
    echo "Usage: ./quick-goal.sh \"goal title\" [\"optional description\"]"
    exit 1
fi

DATE=$(date +%Y-%m-%d)
GOAL_TITLE="$1"
GOAL_DESC="$2"

# Create directory if it doesn't exist
mkdir -p goal

# Create a safe filename using timestamp and hash for uniqueness
# Use a portable hash method that works on both Linux and macOS
if command -v md5sum &> /dev/null; then
    HASH=$(echo -n "$GOAL_TITLE" | md5sum | cut -c1-8)
elif command -v md5 &> /dev/null; then
    HASH=$(echo -n "$GOAL_TITLE" | md5 | cut -c1-8)
else
    # Fallback to timestamp if neither md5 command is available
    HASH=$(date +%s | tail -c 8)
fi

FILENAME="goal/${DATE}-${HASH}.md"

# Create goal file
echo "# ${GOAL_TITLE}" > "$FILENAME"
echo "" >> "$FILENAME"
echo "**Created:** ${DATE}" >> "$FILENAME"
echo "**Status:** 🎯 Active" >> "$FILENAME"
echo "" >> "$FILENAME"

if [ -n "$GOAL_DESC" ]; then
    echo "## Description" >> "$FILENAME"
    echo "$GOAL_DESC" >> "$FILENAME"
    echo "" >> "$FILENAME"
fi

echo "## Progress" >> "$FILENAME"
echo "- [ ] Started" >> "$FILENAME"
echo "" >> "$FILENAME"
echo "## Notes" >> "$FILENAME"
echo "" >> "$FILENAME"

echo "✓ Goal created: $FILENAME"
