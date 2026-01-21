#!/bin/bash
# Warn about console.log statements in modified files

FILE="$1"

if [ -z "$FILE" ]; then
  exit 0
fi

# Check for console.log
if grep -n "console\.log" "$FILE" > /dev/null 2>&1; then
  echo "⚠️  Warning: console.log found in $FILE:"
  grep -n "console\.log" "$FILE"
  echo ""
  echo "   Remove debug statements before committing"
fi

exit 0
