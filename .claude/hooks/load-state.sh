#!/bin/bash
# Load last session state

STATE_DIR=".claude/.state"
LAST_STATE=$(ls -t "$STATE_DIR"/session-*.json 2>/dev/null | head -1)

if [ -z "$LAST_STATE" ]; then
  echo "No previous session state found"
  exit 0
fi

echo "📂 Last session state:"
cat "$LAST_STATE" | jq '.' 2>/dev/null || cat "$LAST_STATE"
echo ""
echo "Working directory: $(pwd)"
echo "Current branch: $(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo 'unknown')"
echo ""
