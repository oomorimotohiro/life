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

# Create a safe filename from the goal title
# Use hash of the title to create a unique identifier
HASH=$(echo -n "$GOAL_TITLE" | md5sum | cut -c1-8)
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
